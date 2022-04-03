package com.orm.mybatis.freemarker.entity;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Controller;

import java.io.Serializable;

/**
 * (User)表控制层
 *
 * @author Yufx
 * @since 2022-03-30 17:53:09
 */
@Controller
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable {
    private static final long serialVersionUID = -34056882387444136L;
    private Integer id;
    private Integer roleId;
    private String name;
    private String sex;
    private String status;
    private String rname;
    private String passwd;

}

