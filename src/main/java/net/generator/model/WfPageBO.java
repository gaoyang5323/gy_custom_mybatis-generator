package net.generator.model;

import lombok.Builder;
import lombok.Data;

/**
 * @author: gaoyang
 * @Description:
 */
@Data
public class WfPageBO {
    private Integer page = 1;
    private Integer limit = 10;

    public void setLimit(Integer limit) {
        if (limit == null || limit < 1) {
            limit = 10;
        }
        this.limit = limit;
    }

    private Integer getOffset() {
        if (page == null || page < 1) {
            page = 1;
        }
        return (page - 1) * limit;
    }
}
