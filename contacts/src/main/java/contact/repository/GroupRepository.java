package contact.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import contact.domain.Group;

public interface GroupRepository extends CrudRepository<Group, Long> {

	List<Group> findByName(String name);
}
