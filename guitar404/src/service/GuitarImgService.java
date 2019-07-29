package service;

import java.util.List;

import entity.Guitar;
import entity.GuitarImg;

public interface GuitarImgService {
	int saveImageByGuitar(Guitar guitar);
	List<GuitarImg> findImgById(String id);
	int delete(String id);
}