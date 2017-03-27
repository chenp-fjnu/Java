package contact.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import contact.domain.Team;
import contact.repository.TeamRepository;

@RestController
@RequestMapping("/team")
public class TeamController {

	@Autowired
	private TeamRepository repository;
	@RequestMapping("/")
	public List<Team> getTeamList(){
		return (List<Team>) repository.findAll();
	}
//	@RequestMapping("/{name}")
//	public Team getTeamByName(@Param String name){
//		return repository.findByName(name).get(0);
//	}
}
