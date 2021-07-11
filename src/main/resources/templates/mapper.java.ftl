package ${package.Mapper};

import ${package.Entity}.${entity};
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.wfcm.entity.bo.WfPageBO;

import java.util.List;
/**
 * ${table.comment!} Mapper 接口
 * @author ${author}
 */
<#if kotlin>
interface ${table.mapperName} : ${superMapperClass}<${entity}>
<#else>
<#--public interface ${table.mapperName} extends ${superMapperClass}<${entity}> {-->
@Repository
public interface ${table.mapperName}{

   int deleteById(<#list table.fields as field><#if field.keyFlag>${field.propertyType}</#if></#list> <#list table.fields as field><#if field.keyFlag>${field.propertyName}</#if></#list>);

   int deleteByIdList(@Param("list") List<<#list table.fields as field><#if field.keyFlag>${field.propertyType}</#if></#list>> idList);

   int insert(${entity} record);

   int insertBatchs(List<${entity}> list);

   int insertSelective(${entity} record);

   int updateByIdSelective(${entity} record);

   int updateById(${entity} record);

   int updateByIdSelectiveBatchs(List<${entity}> recordList);

   ${entity} selectById(<#list table.fields as field><#if field.keyFlag>${field.propertyType}</#if></#list> <#list table.fields as field><#if field.keyFlag>${field.propertyName}</#if></#list>);

   List<${entity}> get${table.entityPath?cap_first}AllListByParam(${entity} param);

   List<${entity}> get${entity}ListByPage(@Param("entity")${entity} param,@Param("pageBo")WfPageBO pageBo);

   int get${entity}ListTotal(@Param("entity")${entity} param);

}
</#if>
