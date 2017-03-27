package contact.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String name;
	private String gender;
	private String brithday;
	private String phone;
	private String address;
	private String extension;
	@ManyToMany(mappedBy="members")
	@JsonIgnore
	private Set<Team> teams = new HashSet<>();
	@OneToMany(mappedBy = "member")
	private Set<MemberDetail> memberDetails = new HashSet<>();

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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBrithday() {
		return brithday;
	}

	public void setBrithday(String brithday) {
		this.brithday = brithday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getExtension() {
		return extension;
	}

	public void setExtension(String extension) {
		this.extension = extension;
	}

	public Set<Team> getTeams() {
		return teams;
	}

	public void setTeams(Set<Team> teams) {
		this.teams = teams;
	}

	public Set<MemberDetail> getMemberDetails() {
		return memberDetails;
	}

	public void setMemberDetails(Set<MemberDetail> memberDetails) {
		this.memberDetails = memberDetails;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", gender=" + gender + ", brithday=" + brithday + ", phone="
				+ phone + ", address=" + address + ", extension=" + extension + ", teams=" + teams + ", memberDetails="
				+ memberDetails + "]";
	}
}
