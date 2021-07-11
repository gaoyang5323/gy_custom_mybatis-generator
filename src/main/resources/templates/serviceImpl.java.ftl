package ${package.ServiceImpl};
<#--import ${superServiceImplClassPackage};-->
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import ${package.Service}.${table.serviceName};
import com.xfs.iqc.utils.*;
import com.xfs.iqc.utils.constant.*;
import com.xfs.iqc.utils.exception.*;
import com.xfs.iqc.utils.uuid.*;
<#--import ${package.Entity?replace("entity","utils")}.*;
import ${package.Entity?replace("entity","utils")}.constant.*;
import ${package.Entity?replace("entity","utils")}.exception.*;
import ${package.Entity?replace("entity","utils")}.uuid.*;-->
import ${package.Entity?replace("entity","vo")}.${entity}VO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import java.util.List;

/**
 * @ClassName: ${table.comment!}
 * @Description: TODO ${table.comment!} 服务实现类
 * @Author:  ${author}
 * @Date:  ${.now}
 */
@Service
<#if kotlin>
    open class ${table.serviceImplName} : ${superServiceImplClass}<${table.mapperName}, ${entity}>(), ${table.serviceName} {

    }
<#else>
<#--public class ${table.serviceImplName} extends ${superServiceImplClass}<${table.mapperName}, ${entity}> implements ${table.serviceName} {-->
public class ${table.serviceImplName} implements ${table.serviceName} {
    @Autowired
    private ${table.mapperName} ${table.entityPath}Mapper;

    /**
     * ${table.comment!}添加
     * @param param 添加入参
     * @return ${entity}VO
     * @throws CustomException
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ${entity}VO  add${entity}(${entity}VO param)throws CustomException {
        if (ObjectUtils.isEmpty(param)) {
            throw new CustomException(MsgConstant.HttpStatus.BAD_REQUEST, MsgConstant.CEM.MISS_PARAM);
        }
        ${entity} record = new ${entity}()
    <#list table.fields as field>
        <#if field.keyFlag>
            .set${field.propertyName?cap_first}(IdUtils.fastSimpleUUID())
        </#if>
    </#list>
    <#list table.commonFields as field><#--生成公共字段 -->
            .set${field.propertyName?cap_first}(param.get${field.propertyName?cap_first}())
    </#list>
    <#list table.fields as field>
        <#if !field.keyFlag><#--生成普通字段 -->
            .set${field.propertyName?cap_first}(param.get${field.propertyName?cap_first}())
        </#if>
    </#list>;
        int count = ${table.entityPath}Mapper.insertSelective(record);
        if (count == 0) {
            throw new CustomException(MsgConstant.HttpStatus.ERROR, MsgConstant.CEM.SAVE_FAIL);
        }
        //返回实体信息
    <#list table.fields as field>
        <#if field.keyFlag>
        param.set${field.propertyName?cap_first}(record.get${field.propertyName?cap_first}());
        </#if>
    </#list>
        return param;
    }

    /**
     * ${table.comment!}删除
     * @param  <#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list> 入参
     * @return void
     * @throws CustomException
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete${entity}ById(String <#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>)throws CustomException{
        if (StringUtils.isBlank(<#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>)) {
            throw new CustomException(MsgConstant.HttpStatus.BAD_REQUEST, MsgConstant.CEM.MISS_PARAM);
        }
        int count = ${table.entityPath}Mapper.deleteByPrimaryKey(<#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>);
        if (count == 0) {
            throw new CustomException(MsgConstant.HttpStatus.ERROR, MsgConstant.CEM.DELETE_FAIL);
        }
    }

    /**
     * ${table.comment!}批量删除
     * @param  idList 入参
     * @return void
     * @throws CustomException
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete${entity}ByIds(List<String> idList)throws CustomException{
        if (ObjectUtils.isEmpty(idList)) {
            throw new CustomException(MsgConstant.HttpStatus.BAD_REQUEST, MsgConstant.CEM.MISS_PARAM);
        }
        int count = ${table.entityPath}Mapper.deleteByIdList(idList);
        if (count == 0) {
            throw new CustomException(MsgConstant.HttpStatus.ERROR, MsgConstant.CEM.DELETE_FAIL);
        }
    }

    /**
     * ${table.comment!}修改
     * @param param 添加入参
     * @return ${entity}VO
     * @throws CustomException
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ${entity}VO update${entity}(${entity}VO param)throws CustomException {
        if (ObjectUtils.isEmpty(param) || ObjectUtils.isEmpty( <#list table.fields as field><#if field.keyFlag>param.get${field.propertyName?cap_first}()</#if></#list> )) {
            throw new CustomException(MsgConstant.HttpStatus.BAD_REQUEST, MsgConstant.CEM.MISS_PARAM);
        }
        ${entity} record = new ${entity}()
    <#list table.fields as field>
        <#if field.keyFlag>
           .set${field.propertyName?cap_first}(param.get${field.propertyName?cap_first}())
        </#if>
    </#list>
    <#list table.commonFields as field><#--生成公共字段 -->
            .set${field.propertyName?cap_first}(param.get${field.propertyName?cap_first}())
    </#list>
    <#list table.fields as field>
    <#if !field.keyFlag><#--生成普通字段 -->
            .set${field.propertyName?cap_first}(param.get${field.propertyName?cap_first}())
    </#if>
    </#list>;
        int count = ${table.entityPath}Mapper.updateByPrimaryKeySelective(record);
        if (count == 0) {
            throw new CustomException(MsgConstant.HttpStatus.ERROR, MsgConstant.CEM.UPDATE_FAIL);
        }
        return param;
    }


    /**
     * ${table.comment!}查询
     * @param <#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list> 查询入参
     * @return ${entity}
     * @throws CustomException
     */
    @Override
    @Transactional(readOnly = true)
    public ${entity} get${entity}InforById(String <#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>)throws CustomException {
        ${entity}  record = ${table.entityPath}Mapper.selectByPrimaryKey(<#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>);
        return record;
    }

    /**
     * ${table.comment!}分页查询
     * @param parmVO 查询入参
     * @param pageNum 当前页数
     * @param pageSize 分页条数
     * @return PageInfo
     * @throws CustomException
     */
    @Override
    @Transactional(readOnly = true)
    public PageInfo get${entity}ListByPage(${entity}VO parmVO,Integer pageNum,Integer pageSize)throws CustomException{
        PageHelper.startPage(pageNum, pageSize);
        List<${entity}> list = ${table.entityPath}Mapper.get${entity}ListByPage(parmVO);
        PageInfo<${entity}> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }
}
</#if>