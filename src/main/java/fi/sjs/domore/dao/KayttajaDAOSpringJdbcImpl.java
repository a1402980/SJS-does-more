package fi.sjs.domore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import fi.sjs.domore.bean.Kayttaja;
import fi.sjs.domore.bean.TapahtumaOsallistuja;

@Repository
public class KayttajaDAOSpringJdbcImpl implements KayttajaDAO {
	
	@Inject
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public void lisaaUusi(Kayttaja k, int tId) {
		
		final String sql = "insert into kayttaja (k_etunimi, k_sukunimi, k_sposti, k_puh) VALUES (?,?,?,?)";

		// anonyymi sis�luokka tarvitsee vakioina v�litett�v�t arvot
		final String etunimi = k.getEtunimi();
		final String sukunimi = k.getSukunimi();
		final String sposti = k.getSposti();
		final String puh = k.getPuh();

		// jdbc pist�� generoidun id:n talteen
		KeyHolder idHolder = new GeneratedKeyHolder();
		

		//p�ivitys PreparedStatementCreatorilla ja KeyHolderilla
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(
					Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(sql,
						new String[] { "id" });
				ps.setString(1, etunimi);
				ps.setString(2, sukunimi);
				ps.setString(3, sposti);
				ps.setString(4, puh);
				return ps;
			}
		}, idHolder);
		
		
		// tallennetaan id takaisin beaniin
		//mikko was here
		k.setId(idHolder.getKey().intValue());
		
		final String sql2 = "insert into tapahtumaosallistuja (k_id, t_id) VALUES (?,?)";
		
		final int kaytId = k.getId();
		final int tapId = tId;
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(
					Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(sql2);
				ps.setInt(1, kaytId);
				ps.setInt(2, tapId);
				return ps;
			}
		});
		
	
	}
	
	public List<Kayttaja> haeKaikki() {		
		String sql = "select k_id, k_etunimi, k_sukunimi, k_kuvaus, k_sposti, k_puh from kayttaja";
		RowMapper<Kayttaja> mapper = new KayttajaRowMapper();
		List<Kayttaja> osallistujat = jdbcTemplate.query(sql,mapper);

		return osallistujat;
	}

	public List<TapahtumaOsallistuja> haeOsallistujat() {
				
		String sql ="select k_id, t_id from tapahtumaosallistuja;";
		RowMapper<TapahtumaOsallistuja> mapper = new TapOsallRowMapper();
		List<TapahtumaOsallistuja> tapahtumaosallistujat = jdbcTemplate.query(sql,mapper);
		return tapahtumaosallistujat;
	
	}

}
