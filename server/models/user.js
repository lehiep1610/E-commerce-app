const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re = /^[a-z0-9.]{1,64}@[a-z0-9.]{1,64}$/i;
        return value.match(re);
      },
      message: "Email address is not valid",
    },
  },
  password: {
    required: true,
    type: String,
  },
  address: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    dafault: "user",
  },
});

const User = mongoose.model("User", userSchema);
module.exports = User;
