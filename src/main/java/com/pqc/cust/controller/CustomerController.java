package com.pqc.cust.controller;

import com.pqc.cust.bean.Customer;
import com.pqc.cust.service.CustomerService;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/cust")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping(value = "/getInfo",method = RequestMethod.POST)
    public String getInfo(Customer customer){
        customer.setAddtime(new Date());
        customerService.getInfo(customer);
        return "redirect:/cust/list";
    }
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public ModelAndView showCustomerList(){
        List<Customer> list = customerService.showCustomerList();
        ModelAndView mav = new ModelAndView("customer");
        mav.addObject("list",list);
        return  mav;
    }
    @RequestMapping(value = "/detail/{id}",method = RequestMethod.GET)
    public String detailCustomer(@PathVariable("id") Integer id, Map<String,Object> map){
        Customer customer = customerService.detailCustomer(id);
        map.put("customer",customer);
        return  "customer-look";
    }
    @RequestMapping(value = "/edit/{id}",method = RequestMethod.GET)
    public String editCustomer(@PathVariable("id") Integer id, Map<String,Object> map){
        Customer customer = customerService.detailCustomer(id);
        map.put("customer",customer);
        return  "customer-edit";
    }
    @RequestMapping(value = "/update",method = RequestMethod.PUT)
    public String updateInfo(Customer customer){
        customerService.updateInfo(customer);
        return "redirect:/cust/list";
    }
    @RequestMapping(value = "/del",method = RequestMethod.DELETE)
    @ResponseBody
    public Map<String,Object> deleteCustomers(@RequestParam("ids[]") Integer[] ids){
        boolean result = customerService.deleteCustomers(ids);
        Map<String,Object> map = new HashMap<String, Object>();
        if(result){
            map.put("statusCode",200);
            map.put("message","删除成功");
        }else{
            map.put("statusCode",500);
            map.put("message","删除失败");
        }
        return map;
    }
    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public ModelAndView searchCustomerList(Integer cid,String keyword,Integer orderby){
        List<Customer> list = customerService.searchCustomerList(cid,keyword,orderby);
        ModelAndView mav = new ModelAndView("customer");
        mav.addObject("list",list);
        return  mav;
    }
    @RequestMapping(value = "/cname",method = RequestMethod.GET)
    @ResponseBody
    public List<Customer> getCustomerCname(){

        return  customerService.showCustomerList();
    }
    @RequestMapping(value = "/info/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Customer getCompanyPerson(@PathVariable("id") Integer id){
        Customer customer = customerService.detailCustomer(id);
        return  customer;
    }
    @RequestMapping(value = "/export",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> exportExcel(){
        Workbook wb = new SXSSFWorkbook();
        Sheet sheet1 = wb.createSheet("customer");
        Row row = sheet1.createRow(0);
        Cell[] cell = new SXSSFCell[5];
        for (int i = 0; i <5 ; i++) {
            cell[i] = row.createCell(i);
        }
        cell[0].setCellValue("ID");
        cell[1].setCellValue("联系人");
        cell[2].setCellValue("公司名称");
        cell[3].setCellValue("添加时间");
        cell[4].setCellValue("联系电话");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        List<Customer> customers = customerService.showCustomerList();
        for (int i = 0; i <customers.size() ; i++) {
            Customer customer = customers.get(i);
            Row row1 = sheet1.createRow(i + 1);
            sheet1.setColumnWidth(3,4000);
            sheet1.setColumnWidth(4,4000);
            Cell[] cell1 = new SXSSFCell[5];
            for (int j = 0; j <5 ; j++) {
                cell1[j] = row1.createCell(j);
            }
            cell1[0].setCellValue(customer.getId());
            cell1[1].setCellValue(customer.getCompanyperson());
            cell1[2].setCellValue(customer.getComname());
            String addtime = sdf.format(customer.getAddtime());
            cell1[3].setCellValue(addtime);
            cell1[4].setCellValue(customer.getComphone());
        }
        FileOutputStream fos= null;

        try {
            fos= new FileOutputStream(new File("d:\\Desktop\\customers.xlsx"));


            wb.write(fos);
            fos.close();
        }catch (Exception ex){

        }finally {
            if(fos != null){
                try {
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        Map<String,Object> map = new HashMap<>();
        map.put("code",200);
        map.put("message","导出Excel成功");
        return map;
    }
    @RequestMapping(value ="/importExcel",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> importExcel(MultipartFile excel){
        Map<String,Object> map = new HashMap<String, Object>();
        List<Customer> customers = new ArrayList<Customer>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try{
            //解析excel
            Workbook wb = WorkbookFactory.create(excel.getInputStream());
            //获取Sheet的数量
            for(int k=0;k<wb.getNumberOfSheets();k++){
                //获取第k个sheet
                Sheet sheet = wb.getSheetAt(k);
                //getFirstRowNum()+1表示获取的是除excel表格标题外的每一行
                for (int i=sheet.getFirstRowNum()+1; i<=sheet.getLastRowNum();i++){

                    Row row = sheet.getRow(i);
                    Customer customer = new Customer();
                    if(row != null){

                        String linkMan = row.getCell(1).getStringCellValue();
                        customer.setCompanyperson(linkMan);
                        String companyName = row.getCell(2).getStringCellValue();
                        customer.setComname(companyName);
                        Date dateCellValue = row.getCell(3).getDateCellValue();
                        String format = sdf.format(dateCellValue);
                        Date addTime = sdf.parse(format);
                        customer.setAddtime(addTime);
                        double numericCellValue = row.getCell(4).getNumericCellValue();
                        BigDecimal decimal = new BigDecimal(String.valueOf(numericCellValue));
                        customer.setComphone(decimal.toPlainString());
                        customerService.getInfo(customer);
                    }
                    customers.add(customer);
                }
            }
            map.put("statusCode",200);
            map.put("message","上传成功");
        }catch (Exception ex){
            System.out.println(ex.getMessage());
            System.out.println("出异常了");
            map.put("statusCode",500);
            map.put("message","上传失败");
        }
        return map;
    }
}
