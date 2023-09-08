package com.empresa.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entity.Medicamento;
import com.empresa.service.MedicamentoService;

@Controller
public class MedicamentoController {

	@Autowired
	private MedicamentoService service;
	
	@GetMapping(value = "/verMedicamento" )
	public String verMedicamento() {return "registraMedicamento";}

	@PostMapping("/registraMedicamento")
	@ResponseBody
	public Map<?, ?> registra(Medicamento obj){
		HashMap<String, String> map = new HashMap<String, String>();
		Medicamento objSalida = service.insertaMedicamento(obj);
		if (objSalida == null) {
			map.put("MENSAJE", "Error en el registro");
		}else {
			map.put("MENSAJE", "Registro exitoso");
		}
		return map;
	}
	
	

}
