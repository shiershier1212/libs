package cn.edu.gxu.model;

public class Type {
    private  int id;
    private  String typename;

    public Type() {
    }

    public Type(int id, String typename) {
        this.id = id;
        this.typename = typename;
    }

    @Override
    public String toString() {
        return "Type{" +
                "id=" + id +
                ", typename='" + typename + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }
}
