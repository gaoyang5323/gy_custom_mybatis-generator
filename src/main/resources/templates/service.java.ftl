package ${package.Service};

import ${package.Entity}.${entity};
import ${superServiceClassPackage};
<#--import ${package.Entity?replace("entity","utils")}.exception.*;-->
import com.xfs.iqc.utils.exception.*;
import com.github.pagehelper.PageInfo;

import java.util.List;

<#--/**
* <p>
 * ${table.comment!} 服务类
 * </p>
*
* @author ${author}
* @since ${date}
*/-->
<#--${table.comment!} ! 斜体 -->
/**
 * @ClassName: ${table.comment!}
 * @Description: TODO(${table.comment!} 服务类)
 * @Author:  ${author}
 * @Date:  ${.now}
 */
<#if kotlin>
 interface ${table.serviceName} : ${superServiceClass}<${entity}>
<#else>
<#--public interface ${table.serviceName} extends ${superServiceClass}<${entity}> {-->
public interface ${table.serviceName} {
   /**
    * ${table.comment!}添加
    * @param param 添加入参
    * @return ${entity}VO
    * @throws CustomException
    */
   ${entity}VO  add${entity}(${entity}VO param)throws CustomException;

   /**
    * ${table.comment!}删除
    * @param  <#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list> 入参
    * @return void
    * @throws CustomException
    */
   void delete${entity}ById(String <#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>)throws CustomException;

   /**
    * ${table.comment!}批量删除
    * @param  idList 入参
    * @return void
    * @throws CustomException
    */
   void delete${entity}ByIds(List<String> idList)throws CustomException;

   /**
    * ${table.comment!}修改
    * @param param 添加入参
    * @return ${entity}VO
    * @throws CustomException
    */
   ${entity}VO update${entity}(${entity}VO param)throws CustomException;
   /**
    * ${table.comment!}查询
    * @param <#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list> 查询入参
    * @return ${entity}
    * @throws CustomException
    */
   ${entity} get${entity}InforById(String <#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>)throws CustomException;


   /**
    * ${table.comment!}分页查询
    * @param parmVO 查询入参
    * @param pageNum 当前页数
    * @param pageSize 分页条数
    * @return PageInfo
    * @throws CustomException
    */
   PageInfo get${entity}ListByPage(${entity}VO parmVO,Integer pageNum,Integer pageSize)throws CustomException;

   /**
    * ${table.comment!}条件检索信息
    * @param parmVO 查询入参
    * @return PageInfo
    * @throws CustomException
    */
   List<${entity}> get${table.entityPath?cap_first}ListByParm(${entity}VO parmVO)throws CustomException;

}
</#if>