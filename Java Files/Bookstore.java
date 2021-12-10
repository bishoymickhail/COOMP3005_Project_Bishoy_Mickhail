import java.util.Scanner;
import java.sql.*;

public class Bookstore {

    public static void main(String[] args){

        // Login (check if user is a customer or owner)

        Scanner login = new Scanner(System.in);
        Scanner input = new Scanner(System.in);

        System.out.println("Welcome to LookInnaABookStore!");
        System.out.println("Are you a new or existing user");
        System.out.println("Existing User (1) ");
        System.out.println("New, create user (2)");

        switch (input.nextInt()){
            case 1:
                System.out.println("Enter Username: \n");
                String userName = login.nextLine();
                System.out.println("Enter Password: \n");
                String password = login.nextLine();
                loginFunc(userName, password);
                break;
            case 2:
                createUser();
                break;
        }
    }

    public static void loginFunc(String userName, String password){

        ResultSet result;
        String type = null;
        String cust = "customer";

        try (Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/LookInnaBookstore", "postgres", "Biboy.24");
             Statement statement = connection.createStatement();
        ) {
            try {
                result = statement.executeQuery(
                        "select type from users where user_name = ('" + userName + "') and password = ('" + password + "')");
                result.next();
                type = result.getString("type");

                if(type.equals(cust)){ //if it's a customer we show certain menu

                    System.out.println("Welcome Customer! \n");

                    Customer c = new Customer(statement,connection, userName);
                    c.customerMenu();

                } else { // owner/manager // if it's a manager we show another menu

                    System.out.println("Welcome Owner! \n");

                    Owner o = new Owner(statement, connection, userName);
                    o.ownerMenu();

                }

            } catch (SQLException sqle) {
                System.out.println("Could not find user " + sqle);
            }

        } catch (Exception sqle){
                System.out.println("Exception: " + sqle);
        }

    }

    public static void createUser () {
        Scanner input = new Scanner(System.in);

        try (Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/LookInnaBookstore", "postgres", "Biboy.24");
             Statement statement = connection.createStatement();
        ) {
            try {
                System.out.println("Please type a username: (*REQUIRED*)");
                String userName = input.nextLine();
                System.out.println("Please type your password: (*REQUIRED*)");
                String passWord = input.nextLine();
                System.out.println("What is your name?");
                String name = input.nextLine();
                System.out.println("What is your email? (*REQUIRED*)");
                String email = input.nextLine();
                System.out.println("What is you address?");
                String address = input.nextLine();
                System.out.println("What is your phone number? ");
                String phone = input.nextLine();
                System.out.println("Are you a Customer (1) or Owner (2) ?");
                String type = null;
                switch (input.nextInt()){
                    case 1:
                        type = "customer";
                        break;
                    case 2:
                        type = "owner";
                        break;
                }

                statement.executeUpdate("insert into users values ('" + name + "', '" + userName + "','" + passWord + "','" + email + "','" + address + "','" + phone + "','" + type + "');");
                System.out.println("\nCongratulations! You have created your profile! You will now be redirected to the store.\n");
                loginFunc(userName, passWord);

            } catch (SQLException sqle) {
                System.out.println("Could not find user " + sqle);
            }

        } catch (Exception sqle){
            System.out.println("Exception: " + sqle);
        }


    }



}
