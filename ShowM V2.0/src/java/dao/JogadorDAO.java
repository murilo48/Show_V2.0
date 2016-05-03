
package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;
import modelo.Jogador;

 
public class JogadorDAO {

    EntityManager em;
    
    public JogadorDAO() throws Exception {
        EntityManagerFactory emf;
        emf = Conexao.getConexao();
        em = emf.createEntityManager();
    }
    
    public void incluir(Jogador obj) throws Exception {
        try {
            em.getTransaction().begin();
            em.persist(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        }
        
    }
    
    public Jogador realizarLogin(String login, String senha){
        TypedQuery<Jogador> query = em.createNamedQuery("Jogador.realizarLogin", Jogador.class);
        //seto os parâmetros
        query.setParameter("login", login);
        query.setParameter("senha", senha);
        Jogador jogador;
        try {
            jogador = query.getSingleResult();
        } catch (Exception e) {
            jogador = null;
        }
        
        return jogador;
    }
    
    public List<Jogador> listar() throws Exception {
        return em.createNamedQuery("Jogador.findAll").getResultList();
    }
    
    public void alterar(Jogador obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.merge(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        }
    }
    
    public void excluir(Jogador obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.remove(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
        }
    }
    public Jogador buscarPorChavePrimaria(String chave){
        return em.find(Jogador.class, chave);
    }
    
    public void fechaEmf() {
        em.close();
        Conexao.closeConexao();
    }
}
