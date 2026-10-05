package model.dao_min;

import java.sql.SQLException;
import model.vo_min.QualityOfficerVO;

public interface QualityOfficerDAO {

    QualityOfficerVO login(String username, String password) throws SQLException;
}

