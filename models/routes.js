/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('routes', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    boulder_grade_id: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'boulder_grades',
        key: 'id'
      }
    },
    toprope_grade_id: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'rope_grades',
        key: 'id'
      }
    },
    color_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'colors',
        key: 'id'
      }
    },
    setter_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'accounts',
        key: 'id'
      }
    },
    note: {
      type: DataTypes.STRING,
      allowNull: false,
      defaultValue: ''
    },
    date: {
      type: DataTypes.DATE,
      allowNull: false
    },
    active: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: '1'
    },
    wall_id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'walls',
        key: 'id'
      }
    },
    lead_grade_id: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'rope_grades',
        key: 'id'
      }
    },
    type: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      defaultValue: '0'
    }
  }, {
    tableName: 'routes'
  });
};
