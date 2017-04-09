package org.web.ssm.model;

import java.util.List;

public class Pages<T> {
    private Integer currentPage;
    private Integer pageSize;
    private Integer totalRow;
    private Integer maxRow;
    private Integer minRow;
    private Integer totalPage;
    private Integer IntkeyWords;
    private String keyWords;
    private String msg;

    @Override
    public String toString() {
        return "Pages{" +
                "currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                ", totalRow=" + totalRow +
                ", maxRow=" + maxRow +
                ", minRow=" + minRow +
                ", totalPage=" + totalPage +
                ", IntkeyWords=" + IntkeyWords +
                ", keyWords='" + keyWords + '\'' +
                ", msg='" + msg + '\'' +
                ", results=" + results +
                '}';
    }


    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    private List<T> results;

    public Integer getMaxRow() {
        return maxRow;
    }

    public void setMaxRow(Integer maxRow) {
        this.maxRow = maxRow;
    }

    public Integer getMinRow() {
        return minRow;
    }

    public void setMinRow(Integer minRow) {
        this.minRow = minRow;
    }

    public Integer getIntkeyWords() {
        return IntkeyWords;
    }

    public void setIntkeyWords(Integer intkeyWords) {
        IntkeyWords = intkeyWords;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalRow() {
        return totalRow;
    }

    public void setTotalRow(Integer totalRow) {
        this.totalRow = totalRow;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public String getKeyWords() {
        return keyWords;
    }

    public void setKeyWords(String keyWords) {
        this.keyWords = keyWords;
    }

    public List<T> getResults() {
        return results;
    }

    public void setResults(List<T> results) {
        this.results = results;
    }
}
