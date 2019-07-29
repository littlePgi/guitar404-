package dao;

import java.sql.Connection;
import java.util.List;

import entity.Guitar;
import entity.GuitarImg;

public interface GuitarImgDao {
	int create(GuitarImg guitarImg, Connection conn);
	List<GuitarImg> findImgById(String id);
	int delete(String id);
}
