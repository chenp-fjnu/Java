# UserLinks
	http://www.bejson.com/
# Spring Boot

## Spring Boot JPA

	https://www.tianmaying.com/tutorial/spring-jpa-query
	
# Key Annotations
	@SpringBootApplication
	@EnableConfigurationProperties
	@EnableJpaRepositories
	
	@RestController
	@EnableAutoConfiguration
	@Autowired
	@GetMapping(value = "/")
	
	@Repository
	
	@Entity
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)

# Note
* Do not put application.java to default package, should have one package for it
* All others class should package underneath package of Application.java
* At least one method in Repository.
* Method in repository can be findBy*field*(), which field should in the entity. 
