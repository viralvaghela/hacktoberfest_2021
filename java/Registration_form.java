import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
public class Registration_form {
    public static void main(String s[]){
       form f = new form();
    }
}

class form implements ActionListener{
    JFrame f;
    JLabel l0, l1,l2,l3,l4,l5;
    JTextField t1,t2;
    JPasswordField p1;
    JRadioButton r1,r2;
    JTextArea ta;
    ButtonGroup bg;
    JButton b1,b2;
    form(){
        f = new JFrame("Registration Form");
        l0 = new JLabel("Form");
        l1 = new JLabel("name");
        l2 = new JLabel("password");
        l3 = new JLabel("email");
        l4 = new JLabel("gender");
        l5 = new JLabel("description :");
        t1 = new JTextField(20);
        t2 = new JTextField(20);
        p1 = new JPasswordField(20);
        r1 = new JRadioButton("Male");
        r2 = new JRadioButton("Female");
        ta = new JTextArea(5,20);
        b1 = new JButton("clear");
        b2 = new JButton("submit");
        bg = new ButtonGroup();
        GridBagConstraints g = new GridBagConstraints();
        f.setLayout(new GridBagLayout()); 
        g.gridwidth = 2;
        g.insets = new Insets(20,100,50,50);
        g.gridx = 0; g.gridy = 0;f.add(l0,g);
        g.gridwidth = 1;
        g.insets = new Insets(20,10,0,0);
        g.anchor = GridBagConstraints.LINE_START;
        g.gridx = 0; g.gridy = 1;f.add(l1,g);
        g.gridx = 1; g.gridy = 1; f.add(t1,g);
        g.gridx = 0; g.gridy = 2;f.add(l2,g);
        g.gridx = 1; g.gridy = 2; f.add(p1,g);
        g.gridx = 0; g.gridy = 3;f.add(l3,g);
        g.gridx = 1; g.gridy = 3; f.add(t2,g);
        g.gridx = 0; g.gridy = 4;f.add(l4,g);
        g.gridx = 1; g.gridy = 4; f.add(r1,g);
        g.gridx = 2; g.gridy = 4; f.add(r2,g);
        g.gridx = 0; g.gridy = 5;f.add(l5,g);
        g.gridwidth = 2;
        g.gridx = 0; g.gridy = 6;f.add(ta,g);
        g.gridwidth = 1;
        g.gridx = 0; g.gridy = 7;f.add(b1,g);
        g.gridx = 1; g.gridy = 7;f.add(b2,g);
       
        bg.add(r1);bg.add(r2);
        b1.addActionListener(this);
        b2.addActionListener(this);
        f.setSize(800,800);
        f.setVisible(true);
        f.setDefaultCloseOperation(f.EXIT_ON_CLOSE);
        f.setLocationRelativeTo(null);
    }
    public void actionPerformed(ActionEvent ae){
        if(ae.getSource() == b1){
            t1.setText("");t2.setText("");p1.setText("");
            bg.clearSelection();
            ta.setText("");
        }
        if(ae.getSource() == b2){
            if((t1.getText()).equals("") || (t2.getText()).equals("") || (p1.getText()).equals("")){
                    JOptionPane.showMessageDialog(null,"Fill The Form Completely");
            }
            else if(r1.isSelected() == false && r2.isSelected() == false){
                JOptionPane.showMessageDialog(null,"Fill The Form Completely");
            }
            else{
                JOptionPane.showMessageDialog(null,"Successfully Registered","Success",JOptionPane.PLAIN_MESSAGE);
            }
        }
    }
}
