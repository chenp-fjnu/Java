package contact.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import contact.domain.Member;

public interface MemberRepository extends CrudRepository<Member, Long> {

	List<Member> findByName(String name);
}
