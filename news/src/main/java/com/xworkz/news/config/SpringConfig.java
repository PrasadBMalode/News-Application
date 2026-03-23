package com.xworkz.news.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@ComponentScan("com.xworkz.news")
@EnableWebMvc
public class SpringConfig {

    @Bean
    public ViewResolver resolver() {
        return new InternalResourceViewResolver("/", ".jsp");
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean managerFactoryBean() {

        LocalContainerEntityManagerFactoryBean factory =
                new LocalContainerEntityManagerFactoryBean();

        factory.setDataSource(dataSource());
        factory.setJpaProperties(jpaProperties());
        factory.setPersistenceUnitName("com.xworkz");
        factory.setPersistenceXmlLocation("classpath:META-INF/persistence.xml");
        factory.setPackagesToScan("com.xworkz.news.entity");

        factory.setJpaVendorAdapter(new HibernateJpaVendorAdapter());

        return factory;
    }

    @Bean
    public MultipartResolver multipartResolver() {
        return new StandardServletMultipartResolver();
    }

//    @Bean
//    public DataSource dataSource() {
//        DriverManagerDataSource ds = new DriverManagerDataSource();
//
//        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
//        ds.setUrl("jdbc:mysql://aws.connect.psdb.cloud:3306/news");
//        ds.setUsername("root");
//        ds.setPassword("Prasad@123");
//
//        return ds;
//    }

    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource ds = new DriverManagerDataSource();
        ds.setDriverClassName("org.postgresql.Driver");
        ds.setUrl("jdbc:postgresql://dpg-d70ma5haae7s73d81sdg-a.oregon-postgres.render.com:5432/news_ubks");
        ds.setUsername("news_ubks_user");
        ds.setPassword("EIP1d0Er9e3jNNSb4p4HrUnmXbi8rMiY");
        return ds;
    }

    @Bean
    public Properties jpaProperties() {
        Properties props = new Properties();
        props.put("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
        props.put("hibernate.hbm2ddl.auto", "update");
        props.put("hibernate.show_sql", "true");
        return props;
    }

}
