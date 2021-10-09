
import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.GridPane;
import javafx.scene.text.Font;
import javafx.stage.Stage;

public class  Calculator extends Application 
{
    private int number1;
	private int number2;
	private String logic;
	private TextField view;
	private boolean flag;

    public class MyButton extends Button{
 
        public MyButton(String text) {
            super(text);
            setPrefWidth(35);
            setPrefHeight(30);
        }
    }
	public void start(Stage primaryStage) 
    {
		try 
        {
			AnchorPane root = new AnchorPane();
			Scene scene = new Scene(root);
			primaryStage.setScene(scene);
			primaryStage.setWidth(228);
			primaryStage.setHeight(260);
			primaryStage.setResizable(false);
			addComp(root);
			primaryStage.show();
		} 
        catch(Exception e) 
        {
			e.printStackTrace();
		}
	}
	private void addComp(AnchorPane root) 
    {
		view = new TextField("0");
		view.setMinSize(200, 50);
		view.setLayoutX(10);
		view.setLayoutY(15);
		view.setEditable(false);
		view.setAlignment(Pos.CENTER_RIGHT);
		view.setFont(new Font("Consolas", 20));
		root.getChildren().add(view);
		
		GridPane gridPane = new GridPane();
		gridPane.setHgap(20);
		gridPane.setVgap(10);
		gridPane.setLayoutY(65);
		gridPane.setPrefWidth(228);
		gridPane.setPrefHeight(185);
		gridPane.setPadding(new Insets(10));

		root.getChildren().add(gridPane);
		Button btn7 = new MyButton("7");
		gridPane.add(btn7,0,0);
		
		Button btn8 = new MyButton("8");
		gridPane.add(btn8,1,0);
		
		Button btn9 = new MyButton("9");
		gridPane.add(btn9,2,0);
		
		Button btn4 = new MyButton("4");
		gridPane.add(btn4,0,1);
		
		Button btn5 = new MyButton("5");
		gridPane.add(btn5,1,1);
		
		Button btn6 = new MyButton("6");
		gridPane.add(btn6,2,1);
		
		Button btn1 = new MyButton("1");
		gridPane.add(btn1,0,2);
		
		Button btn2 = new MyButton("2");
		gridPane.add(btn2,1,2);
		
		Button btn3 = new MyButton("3");
		gridPane.add(btn3,2,2);
		
		Button btn0 = new MyButton("0");
		gridPane.add(btn0,0,3);
		
		Button btnC = new MyButton("C");
		gridPane.add(btnC,1,3);
		
		Button btneq = new MyButton("=");
		gridPane.add(btneq,2,3);

        Button btnadd = new MyButton("+");
		gridPane.add(btnadd,3,0);
		Button btnsub = new MyButton("-");
		gridPane.add(btnsub,3,1);
		Button btnmul = new MyButton("*");
		gridPane.add(btnmul,3,2);
		Button btndiv = new MyButton("/");
		gridPane.add(btndiv,3,3);

    }

	public static void main (String[] args)  
    {  
        launch(args);  
    }  

}