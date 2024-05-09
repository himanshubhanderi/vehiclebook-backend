module.exports = (sequelize, Sequelize) => {
    const Wheels = sequelize.define("wheels", {
      wheelNumber: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
    });
  
    return Wheels;
  };
  