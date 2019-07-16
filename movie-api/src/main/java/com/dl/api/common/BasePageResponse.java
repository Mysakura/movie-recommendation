package com.dl.api.common;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 001977 on 2019-07-10 14:38.
 * 分页结果包装类
 */
@Getter
@Setter
public class BasePageResponse<T> implements Serializable {

    private List<T> dataList;
    private PageInfo pageInfo = new PageInfo();

    @Getter
    @Setter
    public class PageInfo implements Serializable{
        private PageInfo() {}

        // 页码
        private int pageNo;
        // 每一页大小
        private int pageSize;
        // 总记录数
        private int count;
        // 总页数
        private int totalPage;

        public PageInfo setCount(int count) {
            this.count = count;
            return this;
        }

        public PageInfo setPageNo(int pageNo) {
            this.pageNo = pageNo;
            return this;
        }

        public PageInfo setPageSize(int pageSize) {
            this.pageSize = pageSize;
            return this;
        }

        public int getTotalPage() {
            this.totalPage = this.count / pageSize;
            if (this.count % pageSize != 0){
                this.totalPage += 1;
            }
            return totalPage;
        }
    }
}
