package com.dl.api.common.utils;

import com.github.pagehelper.PageHelper;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created on 2019-08-16 17:18.
 *
 * @author zgq7
 */
public class PageModel implements Serializable {

    private PageModel(Instance instance) {
        this.pageNum = instance.pageNum;
        this.pageSize = instance.pageSize;
        this.count = instance.count;
        this.orderBy = instance.orderBy;
    }

    private static final int DEFAULT_PAGENUM = 1;

    private static final int DEFAULT_PAGESIZE = 10;

    private final int pageNum;

    private final int pageSize;

    private boolean count;

    private final LinkedHashMap<String, String> orderBy;

    public static class Instance {

        private int pageNum;
        private int pageSize;
        private boolean count;
        private LinkedHashMap<String, String> orderBy = new LinkedHashMap<>();

        /**
         * 默认页号、默认页数、无排序
         **/
        public Instance() {
            this.pageNum = PageModel.DEFAULT_PAGENUM;
            this.pageSize = PageModel.DEFAULT_PAGESIZE;
            this.count = true;
        }

        /**
         * 自定义页号、自定义页数、无排序、查询总数
         **/
        public Instance(int pageNum, int pageSize) {
            this.pageSize = pageSize;
            this.pageNum = pageNum;
            this.count = true;
        }

        /**
         * 自定义页号、自定义页数、无排序、自定义是否查询总数
         **/
        public Instance(int pageSize, int pageNum, boolean count) {
            this.pageSize = pageSize;
            this.pageNum = pageNum;
            this.count = count;
        }

        public Instance orderBy(LinkedHashMap<String, String> orderBy) {
            this.orderBy = orderBy;
            return this;
        }

        /**
         * 自定义orderBy方法
         **/
        public Instance orderBy(String[] fields, String[] sorts) {
            LinkedHashMap<String, String> orders = Maps.newLinkedHashMap();
            if (fields.length != sorts.length || fields.length == 0) {
                this.orderBy = null;
            }
            for (int i = 0; i < fields.length; i++) {
                orders.put(fields[i], sorts[i]);
            }
            this.orderBy = orders;
            return this;
        }

        public PageModel newPageModel() {
            if (this.orderBy.size() == 0)
                this.orderBy = null;
            return new PageModel(this);
        }

    }

    public int getPageNum() {
        return pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public boolean isCount() {
        return count;
    }

    public LinkedHashMap getOrderBy() {
        return orderBy;
    }

    public static void parsePageModel(PageModel pageModel) {
        LinkedHashMap<String, String> orderBy = pageModel.getOrderBy();
        if (orderBy == null) {
            PageHelper.startPage(pageModel.getPageNum(), pageModel.getPageSize());
        } else {
            List<String> sorts = Lists.newLinkedList();
            orderBy.forEach((k, v) ->
                    sorts.add(k + " " + v)
            );
            String orders = String.join(",", sorts);
            PageHelper.startPage(pageModel.getPageNum(), pageModel.getPageSize(), orders);
        }
    }
}
