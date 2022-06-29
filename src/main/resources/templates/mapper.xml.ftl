<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package.Mapper}.${table.mapperName}">

<#if enableCache>
    <!-- 开启二级缓存 -->
    <cache type="org.mybatis.caches.ehcache.LoggingEhcache"/>

</#if>
<#if baseResultMap>
    <!-- 通用查询映射结果 -->
    <resultMap id="BaseResultMap" type="${package.Entity}.${entity}">
<#list table.fields as field>
<#if field.keyFlag><#--生成主键排在第一位-->
    <id column="${field.name}" property="${field.propertyName}" jdbcType="<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>" />
</#if>
</#list>
<#list table.commonFields as field><#--生成公共字段 -->
    <result column="${field.name}" property="${field.propertyName}" jdbcType="<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>" />
</#list>
<#list table.fields as field>
<#if !field.keyFlag><#--生成普通字段 -->
    <result column="${field.name}" property="${field.propertyName}" jdbcType="<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>" />
</#if>
</#list>
    </resultMap>

</#if>

<#if baseColumnList>
    <!-- 通用查询结果列 -->
    <sql id="Base_Column_List">
<#list table.commonFields as field>
        ${field.name},
</#list>
        ${table.fieldNames}
    </sql>
</#if>

    <insert id="insert" useGeneratedKeys = "true" keyProperty = "id" parameterType="${package.Entity}.${entity}">
        INSERT INTO ${table.name} (${table.fieldNames})
        values (
        <#list table.fields as field>
            <#if field.keyFlag>
                <#if field?size-21 == field_index>${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}<#else>${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},</#if>
            </#if>
        </#list>
        <#list table.commonFields as field><#--生成公共字段 -->
            <#if field?size-21 == field_index>${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}<#else>${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},</#if>
        </#list>
        <#list table.fields as field>
            <#if !field.keyFlag><#--生成普通字段 -->
                <#if field?size-21 == field_index>${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}<#else>${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}<#sep>,</#if>
            </#if>
        </#list>
        )
    </insert>

    <insert id="insertBatchs" useGeneratedKeys = "true" keyProperty = "id" parameterType="java.util.List">
        INSERT INTO ${table.name} (${table.fieldNames})
        values
        <foreach collection="list" item="item" separator=",">
            (
            <#list table.fields as field>
                <#if field.keyFlag>
                    <#if field?size-21 == field_index>${r"#"}{item.${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}<#else>${r"#"}{item.${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},</#if>
                </#if>
            </#list>
            <#list table.commonFields as field><#--生成公共字段 -->
                <#if field?size-21 == field_index>${r"#"}{item.${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}<#else>${r"#"}{item.${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},</#if>
            </#list>
            <#list table.fields as field>
                <#if !field.keyFlag><#--生成普通字段 -->
                    <#if field?size-21 == field_index>${r"#"}{item.${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}<#else>${r"#"}{item.${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}<#sep>,</#if>
                </#if>
            </#list>
            )
        </foreach>
    </insert>

    <insert id="insertSelective" useGeneratedKeys = "true" keyProperty = "id" parameterType="${package.Entity}.${entity}">
        INSERT INTO ${table.name}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <#list table.fields as field>
                <#if field.keyFlag>
                  <if test="${field.propertyName} != null">
                    ${field.name},
                  </if>
                </#if>
            </#list>
            <#list table.commonFields as field><#--生成公共字段 -->
                <if test="${field.propertyName} != null <#if field.columnType == "STRING">and ${field.propertyName}!=''</#if>">
                    ${field.name},
                </if>
            </#list>
            <#list table.fields as field>
                <#if !field.keyFlag><#--生成普通字段 -->
                <if test="${field.propertyName} != null <#if field.columnType == "STRING">and ${field.propertyName}!=''</#if>">
                    ${field.name},
                </if>
                </#if>
            </#list>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <#list table.fields as field>
                <#if field.keyFlag>
                <if test="${field.propertyName} != null">
                     ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},
                </if>
                </#if>
            </#list>
            <#list table.commonFields as field><#--生成公共字段 -->
                <if test="${field.propertyName} != null <#if field.columnType == "STRING">and ${field.propertyName}!=''</#if>">
                    ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},
                </if>
            </#list>
            <#list table.fields as field>
                <#if !field.keyFlag><#--生成普通字段 -->
                <if test="${field.propertyName} != null <#if field.columnType == "STRING">and ${field.propertyName}!=''</#if>">
                    ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},
                </if>
                </#if>
            </#list>
        </trim>
    </insert>

    <delete id="deleteById">
        DELETE FROM ${table.name}
        WHERE <#list table.fields as field><#if field.keyFlag>${field.name} = ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}</#if></#list>
    </delete>

    <delete id="deleteByIdList" parameterType="java.util.List">
        DELETE FROM ${table.name}  WHERE <#list table.fields as field> <#if field.keyFlag>${field.name}</#if> </#list>in
        <foreach item="item" collection="list" open="(" separator="," close=")">
            ${r"#"}{item}
        </foreach>
    </delete>

    <update id="updateByIdSelective" parameterType="${package.Entity}.${entity}">
        UPDATE ${table.name}
        <set>
            <#--<#list table.fields as field>
                <#if field.keyFlag>
                    <if test="${field.propertyName} != null">
                        ${field.name} = ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},
                    </if>
                </#if>
            </#list>-->
            <#list table.commonFields as field><#--生成公共字段 -->
                <if test="${field.propertyName} != null <#if field.columnType == "STRING">and ${field.propertyName}!=''</#if>">
                    ${field.name} = ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},
                </if>
            </#list>
            <#list table.fields as field>
                <#if !field.keyFlag><#--生成普通字段 -->
                    <if test="${field.propertyName} != null <#if field.columnType == "STRING">and ${field.propertyName}!=''</#if>">
                        ${field.name} = ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},
                    </if>
                </#if>
            </#list>
        </set>
        WHERE <#list table.fields as field><#if field.keyFlag>${field.name} = ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}</#if></#list>
    </update>

    <update id="updateById" parameterType="${package.Entity}.${entity}">
        UPDATE ${table.name}
        SET
        <#--<#list table.fields as field>
            <#if field.keyFlag>
              ${field.name} = ${r"#"}{item.${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},
            </#if>
        </#list>-->
        <#list table.commonFields as field><#--生成公共字段 -->
            <#if field?size-21 == field_index>${field.name} = ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}<#else>${field.name} = ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},</#if>
        </#list>
        <#list table.fields as field>
          <#if !field.keyFlag><#--生成普通字段 -->
              <#if field?size-21 == field_index>${field.name} = ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}<#else>${field.name} = ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}<#sep>,</#if>
          </#if>
        </#list>
        WHERE <#list table.fields as field><#if field.keyFlag>${field.name} = ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}</#if></#list>
    </update>

    <update id="updateByIdSelectiveBatchs" parameterType="java.util.List">
        <foreach collection="list" item="item" index="index" separator=";">
            UPDATE ${table.name}
            <set>
              <#list table.commonFields as field><#--生成公共字段 -->
                <if test="item.${field.propertyName} != null <#if field.columnType == "STRING">and item.${field.propertyName}!=''</#if>">
                  ${field.name} = ${r"#"}{item.${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},
                </if>
              </#list>
              <#list table.fields as field>
                <#if !field.keyFlag><#--生成普通字段 -->
                <if test="item.${field.propertyName} != null <#if field.columnType == "STRING">and item.${field.propertyName}!=''</#if>">
                  ${field.name} = ${r"#"}{item.${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},
                </if>
                </#if>
              </#list>
            </set>
            WHERE <#list table.fields as field><#if field.keyFlag>${field.name} = ${r"#"}{item.${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}</#if></#list>
        </foreach>
    </update>


    <select id="selectById" resultMap="BaseResultMap">
        SELECT
        <include refid="Base_Column_List" />
        FROM ${table.name}
        WHERE <#list table.fields as field><#if field.keyFlag>${field.name} = ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}</#if></#list>
    </select>

    <select id="get${entity}ListByPage"  resultMap="BaseResultMap">
        SELECT
        <include refid="Base_Column_List" />
        FROM ${table.name}
        WHERE 1=1
        <#list table.fields as field>
         <#if !field.keyFlag><#--生成普通字段 -->
           <if test="entity.${field.propertyName} != null <#if field.columnType == "STRING">and entity.${field.propertyName}!=''</#if>">
               AND  ${field.name} = ${r"#"}{entity.${field.propertyName}}
           </if>
         </#if>
        </#list>
        ${r"LIMIT #{pageBo.offset}, #{pageBo.limit}"}
    </select>

    <select id="get${entity}ListTotal"  resultType="java.lang.Integer">
        SELECT
        COUNT(*)
        FROM ${table.name}
        WHERE 1=1
        <#list table.fields as field>
         <#if !field.keyFlag><#--生成普通字段 -->
           <if test="entity.${field.propertyName} != null <#if field.columnType == "STRING">and entity.${field.propertyName}!=''</#if>">
               AND  ${field.name} = ${r"#"}{entity.${field.propertyName}}
           </if>
         </#if>
        </#list>
    </select>

    <select id="get${table.entityPath?cap_first}AllListByParam" parameterType="${package.Entity}.${entity}" resultMap="BaseResultMap">
        SELECT
        <include refid="Base_Column_List" />
        FROM ${table.name}
        WHERE 1=1
        <#list table.fields as field>
            <#if field.keyFlag>
                <if test="${field.propertyName} != null">
                    AND  ${field.name} = ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}
                </if>
            </#if>
        </#list>
        <#list table.commonFields as field><#--生成公共字段 -->
            <if test="${field.propertyName} != null <#if field.columnType == "STRING">and ${field.propertyName}!=''</#if>">
                AND  ${field.name}<#if field.propertyName?contains("Name")> like concat('%',${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},'%') <#else> = ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}</#if>
                <#--AND  ${field.name} = ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}-->
            </if>
        </#list>
        <#list table.fields as field>
            <#if !field.keyFlag><#--生成普通字段 -->
                <if test="${field.propertyName} != null <#if field.columnType == "STRING">and ${field.propertyName}!=''</#if>">
                    AND  ${field.name}<#if field.propertyName?contains("Name")> like concat('%',${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>},'%') <#else> = ${r"#"}{${field.propertyName},jdbcType=<#if field.columnType == "STRING">VARCHAR<#elseif field.columnType == "LOCAL_DATE_TIME">TIMESTAMP<#elseif field.columnType == "BIG_DECIMAL">DECIMAL<#elseif field.columnType == "FLOAT">REAL<#else>${field.columnType}</#if>}</#if>
                </if>
            </#if>
        </#list>
    </select>

</mapper>
