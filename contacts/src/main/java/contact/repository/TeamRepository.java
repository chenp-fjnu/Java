package contact.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import contact.domain.Team;

public interface TeamRepository extends CrudRepository<Team, Long> {

	List<Team> findByName(String name);
}
