package models;

public class Student {
    private Long id;
    private int age;
    private int course;
    private String name;
    private String surname;
    private boolean deducted;

    public Student(Long id, int age, int course, String name, String surname, boolean deducted) {
        this.id = id;
        this.age = age;
        this.course = course;
        this.name = name;
        this.surname = surname;
        this.deducted = deducted;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", age=" + age +
                ", course=" + course +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", deducted=" + deducted +
                '}';
    }

    public Student(int age, int course, String name, String surname, boolean deducted) {
        this.age = age;
        this.course = course;
        this.name = name;
        this.surname = surname;
        this.deducted = deducted;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getCourse() {
        return course;
    }

    public void setCourse(int course) {
        this.course = course;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public boolean isDeducted() {
        return deducted;
    }

    public void setDeducted(boolean deducted) {
        this.deducted = deducted;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
