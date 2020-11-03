import React from "react";
import "./FormStyles.css";
import Nav from "./Nav";

class EditTherapist extends React.Component {

    
      render() {
        return (
          <div >
            <Nav/>
            <div class="formScreen">
              <div class="form-style">
                <div class="form-style-heading"> Edit Therapist Information</div>
                  <form action="" method="post">
                    <label for="fname"><span>First Name <span class="required">*</span></span><input type="text" class="input-field" name="fname" value="" /></label>
                    <label for="lname"><span>Last Name <span class="required">*</span></span><input type="text" class="input-field" name="lname" value="" /></label>
                    <label for="email"><span>E-mail <span class="required">*</span></span><input type="text" class="input-field" name="email" value="" /></label>
                    <div class="buttonContainer">
                      <input type="button" onclick="alert('Hello World!')" value="Delete"/>
                      <input type="submit" value="Save" />
                    </div>
                  </form>
                </div>
            </div>
          </div>
        );
      }
    }
export default EditTherapist;