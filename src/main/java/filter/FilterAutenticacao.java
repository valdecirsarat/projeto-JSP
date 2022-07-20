package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import connection.ConnetctionBd;

@WebFilter(urlPatterns = "/principal/*")/* ntercepta todas as requisiçoes e mapeamentos*/
public class FilterAutenticacao extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;
	
	private static Connection connection;


	public FilterAutenticacao() {
    
    }

	
	/* Encerra os processos quando o servidor é parado*/
	public void destroy() {
		try {
			connection.close();
		} 
		catch (SQLException e) {			
			e.printStackTrace();			
		}
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		try {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			String usuarioLogado =(String) session.getAttribute("login");
			String urlParaAutenticacao = req.getServletPath()/* url que esta sendo acessada*/;

			/*realizando a verificação */

			if(usuarioLogado == null  && 
					!urlParaAutenticacao.equalsIgnoreCase("/principal/ServletLogin")){/*para não logado*/

				RequestDispatcher redirecionar = request.getRequestDispatcher("/index.jsp?url="+urlParaAutenticacao);
				request.setAttribute("msg", "POR FAVOR REALIZE O LOGIN!");
				redirecionar.forward(req, response);
				return;
			}
			else {/*para logado*/
				chain.doFilter(request, response);				
			}
			
			connection.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {				
				e1.printStackTrace();
			}
		}
		
	}

	/*inicia os processos */
	public void init(FilterConfig fConfig) throws ServletException {
		ConnetctionBd connetctionBd = new ConnetctionBd();
		connection =  connetctionBd.getConnection();
		
	}

}
