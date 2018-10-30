package com.xpbs.service;

import com.xpbs.dao.StudentDao;
import com.xpbs.domain.Meun;
import com.xpbs.domain.Student;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by admin on 2018/10/25.
 */
@Service
public class StudentServiceImpl implements StudentService {
    private Logger logger=Logger.getLogger(StudentService.class);
    @Autowired
    private StudentDao studentDao;
    @Override
    public Student getStudent(String username, String password) {
        try {
            Student student = studentDao.queryStudentByNameAndPassword(username, password);
            return student;
        }catch (Exception e){
            logger.error(""+e);
        }
        return null;
    }

    @Override
    public List<Meun> getStudentMeunByUserid(String userid) {
        try {
            List<Meun> meuns = studentDao.queryStudentMenuByUserid(userid);
            return meuns;
        }catch (Exception e){
            logger.error(""+e);
        }
        return null;
    }
}
