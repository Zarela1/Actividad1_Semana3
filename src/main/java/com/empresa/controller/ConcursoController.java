package com.empresa.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.empresa.entity.Concurso;
import com.empresa.service.ConcursoService;

@Controller
public class ConcursoController {

	@Autowired
	private ConcursoService service;
	
	@GetMapping(value = "/verConcurso" )
	public String verConcurso() {return "registraConcurso";}

	@PostMapping("/registraConcurso")
	@ResponseBody
	public Map<?, ?> registra(Concurso obj){
		HashMap<String, String> map = new HashMap<String, String>();
		Concurso objSalida = service.insertaConcurso(obj);
		if (objSalida == null) {
			map.put("MENSAJE", "Error en el registro");
		}else {
			map.put("MENSAJE", "Registro exitoso");
		}
		return map;
	}
	
	
	

}
