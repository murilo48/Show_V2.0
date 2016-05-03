
package modelo;

import dao.PerguntaDAO;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Jogo {
    private List<Pergunta> perguntas;
    private Integer pontuacao;
    private Integer pulos;
    
    public Jogo(){
        this.pulos = 3;
        this.pontuacao = 0;
        this.perguntas = new ArrayList<Pergunta>();
    }

    public List<Pergunta> getPerguntas() {
        return perguntas;
    }

    public void setPerguntas(List<Pergunta> perguntas) {
        this.perguntas = perguntas;
    }

    public Integer getPontuacao() {
        return pontuacao;
    }

    public void setPontuacao(Integer pontuacao) {    
        this.pontuacao = pontuacao;
    }

    public Integer getPulos() {
        return pulos;
    }

    public void setPulos(Integer pulos) {
        this.pulos = pulos;
    }
    
    public void execPulo(){
        this.pulos=pulos-1;
    }
    public Integer AcertouP(){
        Integer acerto = 0;
        if(this.pontuacao == 0){
           acerto = 5000;
        }
        else if(this.pontuacao >= 2000){
            acerto = pontuacao + 5000;
            if(this.pontuacao >= 100000){
                acerto = this.pontuacao * 2;
            }
        }
        return acerto;
    }
    public Integer ErrouP(){
        return pontuacao / 3;
    }
    public Integer ParouP(){
        return pontuacao;
    }
    
    public void iniciar(){
        try {
            PerguntaDAO dao = new PerguntaDAO();
            this.setPerguntas(dao.listar());
        } catch (Exception ex) {
            Logger.getLogger(Jogo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public boolean confirmar(String opcaomarcada){
        if(opcaomarcada.equals(this.getPerguntas().get(0).getCerta()))
        {
            this.getPerguntas().remove(0);
            this.setPontuacao(this.AcertouP());
            return true;
        }
        else{
            return false;
        }
    }
    public boolean pular(){
        if(this.getPulos()!=null){
            this.pulos--;
            return true;
        }
        else{
            return false;
        }
    }
}