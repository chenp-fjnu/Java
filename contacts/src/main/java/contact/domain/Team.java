package contact.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
public class Team {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String name;
	private String description;
	
	@OneToMany(mappedBy = "team")
	private Set<TeamDetail> teamDetails = new HashSet<>();
	@ManyToMany
	@JoinTable(name = "team_member", 
				joinColumns = @JoinColumn(name = "team_id", referencedColumnName = "id"), 
				inverseJoinColumns = @JoinColumn(name = "member_id", referencedColumnName = "id"))
	private Set<Member> members = new HashSet<>();
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<Member> getMembers() {
		return members;
	}

	public void setMembers(Set<Member> members) {
		this.members = members;
	}

	public Set<TeamDetail> getTeamDetails() {
		return teamDetails;
	}

	public void setTeamDetails(Set<TeamDetail> teamDetails) {
		this.teamDetails = teamDetails;
	}

	@Override
	public String toString() {
		return "Team [id=" + id + ", name=" + name + ", description=" + description + ", members=" + members
				+ ", teamDetails=" + teamDetails + "]";
	}

}
