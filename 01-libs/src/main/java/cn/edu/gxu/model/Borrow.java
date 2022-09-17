package cn.edu.gxu.model;


public class Borrow {

    private long id;
    private long bookid;
    private long customerid;
    private java.sql.Date bdate;
    private java.sql.Date rdate;
    private Book book;//外接的
    private Customer customer;//外接的

    @Override
    public String toString() {
        return "Borrow{" +
                "id=" + id +
                ", bookid=" + bookid +
                ", customerid=" + customerid +
                ", bdate=" + bdate +
                ", rdate=" + rdate +
                ", book=" + book +
                ", customer=" + customer +
                '}';
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


    public long getBookid() {
        return bookid;
    }

    public void setBookid(long bookid) {
        this.bookid = bookid;
    }


    public long getCustomerid() {
        return customerid;
    }

    public void setCustomerid(long customerid) {
        this.customerid = customerid;
    }


    public java.sql.Date getBdate() {
        return bdate;
    }

    public void setBdate(java.sql.Date bdate) {
        this.bdate = bdate;
    }


    public java.sql.Date getRdate() {
        return rdate;
    }

    public void setRdate(java.sql.Date rdate) {
        this.rdate = rdate;
    }

}
