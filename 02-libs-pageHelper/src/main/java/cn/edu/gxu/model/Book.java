package cn.edu.gxu.model;


import java.sql.Date;

public class Book {

  private long id;
  private String name;
  private String ename;
  private String author;
  private String publisher;
  private java.sql.Date pdate;
  private String isbn;
  private long price;
  private String address;
  private String brief;
  private long typeid;
  private String image;
  private Type type = null;

  public Type getType() {
    return type;
  }

  public void setType(Type type) {
    this.type = type;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getEname() {
    return ename;
  }

  public void setEname(String ename) {
    this.ename = ename;
  }


  public String getAuthor() {
    return author;
  }

  public void setAuthor(String author) {
    this.author = author;
  }


  public String getPublisher() {
    return publisher;
  }

  public void setPublisher(String publisher) {
    this.publisher = publisher;
  }


  public Date getPdate() {
    return pdate;
  }

  public void setPdate(Date pdate) {
    this.pdate = pdate;
  }

  public String getIsbn() {
    return isbn;
  }

  public void setIsbn(String isbn) {
    this.isbn = isbn;
  }


  public long getPrice() {
    return price;
  }

  public void setPrice(long price) {
    this.price = price;
  }


  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }


  public String getBrief() {
    return brief;
  }

  public void setBrief(String brief) {
    this.brief = brief;
  }


  public long getTypeid() {
    return typeid;
  }

  public void setTypeid(long typeid) {
    this.typeid = typeid;
  }


  public String getImage() {
    return image;
  }

  public void setImage(String image) {
    this.image = image;
  }

  @Override
  public String toString() {
    return "Book{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", ename='" + ename + '\'' +
            ", author='" + author + '\'' +
            ", publisher='" + publisher + '\'' +
            ", pdate=" + pdate +
            ", isbn='" + isbn + '\'' +
            ", price=" + price +
            ", address='" + address + '\'' +
            ", brief='" + brief + '\'' +
            ", typeid=" + typeid +
            ", image='" + image + '\'' +
            ", type=" + type +
            '}';
  }
}
