package com.dl.movieservice.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CinemaSeatExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer limitStart;

    protected Integer limitEnd;

    public CinemaSeatExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setLimitStart(Integer limitStart) {
        this.limitStart=limitStart;
    }

    public Integer getLimitStart() {
        return limitStart;
    }

    public void setLimitEnd(Integer limitEnd) {
        this.limitEnd=limitEnd;
    }

    public Integer getLimitEnd() {
        return limitEnd;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andCinemaIdIsNull() {
            addCriterion("cinema_id is null");
            return (Criteria) this;
        }

        public Criteria andCinemaIdIsNotNull() {
            addCriterion("cinema_id is not null");
            return (Criteria) this;
        }

        public Criteria andCinemaIdEqualTo(Integer value) {
            addCriterion("cinema_id =", value, "cinemaId");
            return (Criteria) this;
        }

        public Criteria andCinemaIdNotEqualTo(Integer value) {
            addCriterion("cinema_id <>", value, "cinemaId");
            return (Criteria) this;
        }

        public Criteria andCinemaIdGreaterThan(Integer value) {
            addCriterion("cinema_id >", value, "cinemaId");
            return (Criteria) this;
        }

        public Criteria andCinemaIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("cinema_id >=", value, "cinemaId");
            return (Criteria) this;
        }

        public Criteria andCinemaIdLessThan(Integer value) {
            addCriterion("cinema_id <", value, "cinemaId");
            return (Criteria) this;
        }

        public Criteria andCinemaIdLessThanOrEqualTo(Integer value) {
            addCriterion("cinema_id <=", value, "cinemaId");
            return (Criteria) this;
        }

        public Criteria andCinemaIdIn(List<Integer> values) {
            addCriterion("cinema_id in", values, "cinemaId");
            return (Criteria) this;
        }

        public Criteria andCinemaIdNotIn(List<Integer> values) {
            addCriterion("cinema_id not in", values, "cinemaId");
            return (Criteria) this;
        }

        public Criteria andCinemaIdBetween(Integer value1, Integer value2) {
            addCriterion("cinema_id between", value1, value2, "cinemaId");
            return (Criteria) this;
        }

        public Criteria andCinemaIdNotBetween(Integer value1, Integer value2) {
            addCriterion("cinema_id not between", value1, value2, "cinemaId");
            return (Criteria) this;
        }

        public Criteria andVideoHallIsNull() {
            addCriterion("video_hall is null");
            return (Criteria) this;
        }

        public Criteria andVideoHallIsNotNull() {
            addCriterion("video_hall is not null");
            return (Criteria) this;
        }

        public Criteria andVideoHallEqualTo(String value) {
            addCriterion("video_hall =", value, "videoHall");
            return (Criteria) this;
        }

        public Criteria andVideoHallNotEqualTo(String value) {
            addCriterion("video_hall <>", value, "videoHall");
            return (Criteria) this;
        }

        public Criteria andVideoHallGreaterThan(String value) {
            addCriterion("video_hall >", value, "videoHall");
            return (Criteria) this;
        }

        public Criteria andVideoHallGreaterThanOrEqualTo(String value) {
            addCriterion("video_hall >=", value, "videoHall");
            return (Criteria) this;
        }

        public Criteria andVideoHallLessThan(String value) {
            addCriterion("video_hall <", value, "videoHall");
            return (Criteria) this;
        }

        public Criteria andVideoHallLessThanOrEqualTo(String value) {
            addCriterion("video_hall <=", value, "videoHall");
            return (Criteria) this;
        }

        public Criteria andVideoHallLike(String value) {
            addCriterion("video_hall like", value, "videoHall");
            return (Criteria) this;
        }

        public Criteria andVideoHallNotLike(String value) {
            addCriterion("video_hall not like", value, "videoHall");
            return (Criteria) this;
        }

        public Criteria andVideoHallIn(List<String> values) {
            addCriterion("video_hall in", values, "videoHall");
            return (Criteria) this;
        }

        public Criteria andVideoHallNotIn(List<String> values) {
            addCriterion("video_hall not in", values, "videoHall");
            return (Criteria) this;
        }

        public Criteria andVideoHallBetween(String value1, String value2) {
            addCriterion("video_hall between", value1, value2, "videoHall");
            return (Criteria) this;
        }

        public Criteria andVideoHallNotBetween(String value1, String value2) {
            addCriterion("video_hall not between", value1, value2, "videoHall");
            return (Criteria) this;
        }

        public Criteria andRowNoIsNull() {
            addCriterion("row_no is null");
            return (Criteria) this;
        }

        public Criteria andRowNoIsNotNull() {
            addCriterion("row_no is not null");
            return (Criteria) this;
        }

        public Criteria andRowNoEqualTo(Integer value) {
            addCriterion("row_no =", value, "rowNo");
            return (Criteria) this;
        }

        public Criteria andRowNoNotEqualTo(Integer value) {
            addCriterion("row_no <>", value, "rowNo");
            return (Criteria) this;
        }

        public Criteria andRowNoGreaterThan(Integer value) {
            addCriterion("row_no >", value, "rowNo");
            return (Criteria) this;
        }

        public Criteria andRowNoGreaterThanOrEqualTo(Integer value) {
            addCriterion("row_no >=", value, "rowNo");
            return (Criteria) this;
        }

        public Criteria andRowNoLessThan(Integer value) {
            addCriterion("row_no <", value, "rowNo");
            return (Criteria) this;
        }

        public Criteria andRowNoLessThanOrEqualTo(Integer value) {
            addCriterion("row_no <=", value, "rowNo");
            return (Criteria) this;
        }

        public Criteria andRowNoIn(List<Integer> values) {
            addCriterion("row_no in", values, "rowNo");
            return (Criteria) this;
        }

        public Criteria andRowNoNotIn(List<Integer> values) {
            addCriterion("row_no not in", values, "rowNo");
            return (Criteria) this;
        }

        public Criteria andRowNoBetween(Integer value1, Integer value2) {
            addCriterion("row_no between", value1, value2, "rowNo");
            return (Criteria) this;
        }

        public Criteria andRowNoNotBetween(Integer value1, Integer value2) {
            addCriterion("row_no not between", value1, value2, "rowNo");
            return (Criteria) this;
        }

        public Criteria andSeatNoIsNull() {
            addCriterion("seat_no is null");
            return (Criteria) this;
        }

        public Criteria andSeatNoIsNotNull() {
            addCriterion("seat_no is not null");
            return (Criteria) this;
        }

        public Criteria andSeatNoEqualTo(Integer value) {
            addCriterion("seat_no =", value, "seatNo");
            return (Criteria) this;
        }

        public Criteria andSeatNoNotEqualTo(Integer value) {
            addCriterion("seat_no <>", value, "seatNo");
            return (Criteria) this;
        }

        public Criteria andSeatNoGreaterThan(Integer value) {
            addCriterion("seat_no >", value, "seatNo");
            return (Criteria) this;
        }

        public Criteria andSeatNoGreaterThanOrEqualTo(Integer value) {
            addCriterion("seat_no >=", value, "seatNo");
            return (Criteria) this;
        }

        public Criteria andSeatNoLessThan(Integer value) {
            addCriterion("seat_no <", value, "seatNo");
            return (Criteria) this;
        }

        public Criteria andSeatNoLessThanOrEqualTo(Integer value) {
            addCriterion("seat_no <=", value, "seatNo");
            return (Criteria) this;
        }

        public Criteria andSeatNoIn(List<Integer> values) {
            addCriterion("seat_no in", values, "seatNo");
            return (Criteria) this;
        }

        public Criteria andSeatNoNotIn(List<Integer> values) {
            addCriterion("seat_no not in", values, "seatNo");
            return (Criteria) this;
        }

        public Criteria andSeatNoBetween(Integer value1, Integer value2) {
            addCriterion("seat_no between", value1, value2, "seatNo");
            return (Criteria) this;
        }

        public Criteria andSeatNoNotBetween(Integer value1, Integer value2) {
            addCriterion("seat_no not between", value1, value2, "seatNo");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateUserIsNull() {
            addCriterion("create_user is null");
            return (Criteria) this;
        }

        public Criteria andCreateUserIsNotNull() {
            addCriterion("create_user is not null");
            return (Criteria) this;
        }

        public Criteria andCreateUserEqualTo(String value) {
            addCriterion("create_user =", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotEqualTo(String value) {
            addCriterion("create_user <>", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserGreaterThan(String value) {
            addCriterion("create_user >", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserGreaterThanOrEqualTo(String value) {
            addCriterion("create_user >=", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLessThan(String value) {
            addCriterion("create_user <", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLessThanOrEqualTo(String value) {
            addCriterion("create_user <=", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLike(String value) {
            addCriterion("create_user like", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotLike(String value) {
            addCriterion("create_user not like", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserIn(List<String> values) {
            addCriterion("create_user in", values, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotIn(List<String> values) {
            addCriterion("create_user not in", values, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserBetween(String value1, String value2) {
            addCriterion("create_user between", value1, value2, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotBetween(String value1, String value2) {
            addCriterion("create_user not between", value1, value2, "createUser");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNull() {
            addCriterion("update_time is null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNotNull() {
            addCriterion("update_time is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeEqualTo(Date value) {
            addCriterion("update_time =", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotEqualTo(Date value) {
            addCriterion("update_time <>", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThan(Date value) {
            addCriterion("update_time >", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("update_time >=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThan(Date value) {
            addCriterion("update_time <", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThanOrEqualTo(Date value) {
            addCriterion("update_time <=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIn(List<Date> values) {
            addCriterion("update_time in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotIn(List<Date> values) {
            addCriterion("update_time not in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeBetween(Date value1, Date value2) {
            addCriterion("update_time between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotBetween(Date value1, Date value2) {
            addCriterion("update_time not between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIsNull() {
            addCriterion("update_user is null");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIsNotNull() {
            addCriterion("update_user is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateUserEqualTo(String value) {
            addCriterion("update_user =", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserNotEqualTo(String value) {
            addCriterion("update_user <>", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserGreaterThan(String value) {
            addCriterion("update_user >", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserGreaterThanOrEqualTo(String value) {
            addCriterion("update_user >=", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserLessThan(String value) {
            addCriterion("update_user <", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserLessThanOrEqualTo(String value) {
            addCriterion("update_user <=", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserLike(String value) {
            addCriterion("update_user like", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserNotLike(String value) {
            addCriterion("update_user not like", value, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserIn(List<String> values) {
            addCriterion("update_user in", values, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserNotIn(List<String> values) {
            addCriterion("update_user not in", values, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserBetween(String value1, String value2) {
            addCriterion("update_user between", value1, value2, "updateUser");
            return (Criteria) this;
        }

        public Criteria andUpdateUserNotBetween(String value1, String value2) {
            addCriterion("update_user not between", value1, value2, "updateUser");
            return (Criteria) this;
        }

        public Criteria andDeleteFlagIsNull() {
            addCriterion("delete_flag is null");
            return (Criteria) this;
        }

        public Criteria andDeleteFlagIsNotNull() {
            addCriterion("delete_flag is not null");
            return (Criteria) this;
        }

        public Criteria andDeleteFlagEqualTo(Boolean value) {
            addCriterion("delete_flag =", value, "deleteFlag");
            return (Criteria) this;
        }

        public Criteria andDeleteFlagNotEqualTo(Boolean value) {
            addCriterion("delete_flag <>", value, "deleteFlag");
            return (Criteria) this;
        }

        public Criteria andDeleteFlagGreaterThan(Boolean value) {
            addCriterion("delete_flag >", value, "deleteFlag");
            return (Criteria) this;
        }

        public Criteria andDeleteFlagGreaterThanOrEqualTo(Boolean value) {
            addCriterion("delete_flag >=", value, "deleteFlag");
            return (Criteria) this;
        }

        public Criteria andDeleteFlagLessThan(Boolean value) {
            addCriterion("delete_flag <", value, "deleteFlag");
            return (Criteria) this;
        }

        public Criteria andDeleteFlagLessThanOrEqualTo(Boolean value) {
            addCriterion("delete_flag <=", value, "deleteFlag");
            return (Criteria) this;
        }

        public Criteria andDeleteFlagIn(List<Boolean> values) {
            addCriterion("delete_flag in", values, "deleteFlag");
            return (Criteria) this;
        }

        public Criteria andDeleteFlagNotIn(List<Boolean> values) {
            addCriterion("delete_flag not in", values, "deleteFlag");
            return (Criteria) this;
        }

        public Criteria andDeleteFlagBetween(Boolean value1, Boolean value2) {
            addCriterion("delete_flag between", value1, value2, "deleteFlag");
            return (Criteria) this;
        }

        public Criteria andDeleteFlagNotBetween(Boolean value1, Boolean value2) {
            addCriterion("delete_flag not between", value1, value2, "deleteFlag");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}