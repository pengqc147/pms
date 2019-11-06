package com.pqc.utils;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ExcelUtils {
    public static String parseExcelValueToStriong(Cell c){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String result = "";
        switch(c.getCellType()){
            case Cell.CELL_TYPE_BLANK:
                result = "";
                break;
            case Cell.CELL_TYPE_BOOLEAN:
                result = String.valueOf(c.getBooleanCellValue());
                break;
            case Cell.CELL_TYPE_FORMULA:

                result = String.valueOf(c.getCellFormula());
                break;
            case Cell.CELL_TYPE_NUMERIC:
                if(HSSFDateUtil.isCellDateFormatted(c)){
                    Date date = c.getDateCellValue();
                    result = sdf.format(date);
                }else {
                    result = c.getNumericCellValue()+"";
                }
                break;
            case Cell.CELL_TYPE_STRING:
                result = c.getStringCellValue();
                break;
            default:
                result = null;
                break;
        }
        return result;
    }
}
