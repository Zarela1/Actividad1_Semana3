package com.empresa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Concurso;
import com.empresa.repository.ConcursoRepository;



@Service
public class ConcursoServiceImpl implements ConcursoService {

	@Autowired
	private ConcursoRepository repository;

	@Override
	public Concurso insertaConcurso(Concurso obj) {
		return repository.save(obj);
	}

}
