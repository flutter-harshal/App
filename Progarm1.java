class Employee{
    
        int eid;
        String name;
        double sal;

        Employee(int eid,String name, double sal){
            this.eid=eid;
            this.name=name;
            this.sal=sal;
        }

        void fun(){

        }
    }
class Client{
    public static void main(String[] args){

        Employee obj= new Employee(12,"HARSHAL",1.5);
        obj.fun();
    }
}