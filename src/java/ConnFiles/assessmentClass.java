/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConnFiles;

/**
 *
 * @author Rishabh
 */
public class assessmentClass {
    public String assess(int per){
        if(per>75){
            return "You are excellent in this topic";
        }else if(per>60){
            return "Your performance is good";
        }else if(per>40){
            return "Skills on this topic can be improved with regular practice";
        }else{
            return "You need to practice hard";
        }
    }
}
