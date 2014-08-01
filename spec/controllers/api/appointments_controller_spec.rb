require 'spec_helper'

describe Api::AppointmentsController do
  render_views

  context "authenticatied requests" do 
    before do 
      @access_key  = create(:access_key)
      @future_date = (DateTime.now + 3.days).strftime("%Y-%m-%d")
    end

    describe "#list" do
      it "should require the :api_authentication_required before_filter to be triggered" do
        controller.should_receive(:api_authentication_required)
        get :list, format: :json, token: @access_key.token
      end

      it "should return a list of apppintments" do 

        appointment_1 = create(:appointment, first_name: "Zion", start_time: "#{@future_date} 5:00 PM", end_time: "#{@future_date} 5:30 PM")
        appointment_2 = create(:appointment, first_name: "Elijah", start_time: "#{@future_date} 7:00 PM", end_time: "#{@future_date} 8:30 PM")
        
        get :list, format: :json, token: @access_key.token
        json.should ==  { 
                          "appointments" =>  
                            [
                              { 
                                "id" => appointment_1.id, 
                                "first_name" => "Zion", 
                                "last_name" => "Lewis", 
                                "start_time" => "#{@future_date}T17:00:00.000Z", 
                                "end_time" => "#{@future_date}T17:30:00.000Z"
                              }, 
                              {
                                "id"=> appointment_2.id, 
                                "first_name"=> "Elijah", 
                                "last_name"=> "Lewis", 
                                "start_time" => "#{@future_date}T19:00:00.000Z",
                                 "end_time" => "#{@future_date}T20:30:00.000Z"
                              }
                            ]
                        }
      end

      it "should return 200 status code" do 
        get :list, format: :json, token: @access_key.token
        response.status.should == 200
      end

      context "filtering" do 
        it "should return appointment by :start_time" do
          appointment_1 = create(:appointment, first_name: "Zion", start_time: "#{@future_date}T09:00:00.000Z", end_time: "#{@future_date}T09:30:00.000Z")
          appointment_2 = create(:appointment, first_name: "Sharon", start_time: "#{@future_date} 5:00 PM", end_time: "#{@future_date} 5:30 PM")
          appointment_3 = create(:appointment, first_name: "Rodney", start_time: "#{@future_date} 7:00 PM", end_time: "#{@future_date} 7:30 PM")
          appointment_4 = create(:appointment, first_name: "Elijah", start_time: "#{@future_date} 6:00 PM", end_time: "#{@future_date} 6:30 PM")  

          get :list, format: :json, start_time_filter: "#{@future_date}T09:00:00.000Z", token: @access_key.token
          json.should ==  { 
                            "filter" => {
                              "by" => "start_time",
                              "param" => "#{@future_date}T09:00:00.000Z"
                            },
                            "appointments" =>  
                              [
                                { 
                                  "id" => appointment_1.id, 
                                  "first_name" => "Zion", 
                                  "last_name" => "Lewis", 
                                  "start_time" => "#{@future_date}T09:00:00.000Z", 
                                  "end_time" => "#{@future_date}T09:30:00.000Z"
                                }, 

                              ]
                          }

          json.should_not ==  { 
                                "filter" => {
                                  "by" => "start_time",
                                  "param" => "#{@future_date}T09:00:00.000Z"
                                },
                                "appointments" =>  
                                  [
                                    {
                                      "id"=> appointment_2.id, 
                                      "first_name"=> "Sharon", 
                                      "last_name"=> "Lewis", 
                                      "start_time" => "#{@future_date}T17:00:00.000Z",
                                       "end_time" => "#{@future_date}T17:30:00.000Z"
                                    },
                                    { 
                                      "id" => appointment_3.id, 
                                      "first_name" => "Rodney", 
                                      "last_name" => "Lewis", 
                                      "start_time" => "#{@future_date}T19:00:00.000Z", 
                                      "end_time" => "#{@future_date}T19:30:00.000Z"
                                    }, 
                                    {
                                      "id"=> appointment_4.id, 
                                      "first_name"=> "Elijah", 
                                      "last_name"=> "Lewis", 
                                      "start_time" => "#{@future_date}T18:00:00.000Z",
                                       "end_time" => "#{@future_date}T18:30:00.000Z"
                                    }
                                  ]
                              }
        end

        it "should return all appointments by :end_time" do 
          appointment_1 = create(:appointment, first_name: "Zion", start_time: "#{@future_date}T09:00:00.000Z", end_time: "#{@future_date}T09:30:00.000Z")
          appointment_2 = create(:appointment, first_name: "Sharon", start_time: "#{@future_date} 5:00 PM", end_time: "#{@future_date} 5:30 PM")
          appointment_3 = create(:appointment, first_name: "Rodney", start_time: "#{@future_date} 7:00 PM", end_time: "#{@future_date} 7:30 PM")
          appointment_4 = create(:appointment, first_name: "Elijah", start_time: "#{@future_date} 6:00 PM", end_time: "#{@future_date} 6:30 PM")  

          get :list, format: :json, end_time_filter: "#{@future_date}T09:30:00.000Z", token: @access_key.token
          json.should ==  { 
                            "filter" => {
                                "by" => "end_time",
                                "param" => "#{@future_date}T09:30:00.000Z"
                            },
                            "appointments" =>  
                              [
                                { 
                                  "id" => appointment_1.id, 
                                  "first_name" => "Zion", 
                                  "last_name" => "Lewis", 
                                  "start_time" => "#{@future_date}T09:00:00.000Z", 
                                  "end_time" => "#{@future_date}T09:30:00.000Z"
                                }, 

                              ]
                          }

          json.should_not ==  { 
                                "filter" => {
                                  "by" => "end_time",
                                  "param" => "#{@future_date}T09:30:00.000Z"
                                },
                                "appointments" =>  
                                  [
                                    {
                                      "id"=> appointment_2.id, 
                                      "first_name"=> "Sharon", 
                                      "last_name"=> "Lewis", 
                                      "start_time" => "#{@future_date}T17:00:00.000Z",
                                       "end_time" => "#{@future_date}T17:30:00.000Z"
                                    },
                                    { 
                                      "id" => appointment_3.id, 
                                      "first_name" => "Rodney", 
                                      "last_name" => "Lewis", 
                                      "start_time" => "#{@future_date}T19:00:00.000Z", 
                                      "end_time" => "#{@future_date}T19:30:00.000Z"
                                    }, 
                                    {
                                      "id"=> appointment_4.id, 
                                      "first_name"=> "Elijah", 
                                      "last_name"=> "Lewis", 
                                      "start_time" => "#{@future_date}T18:00:00.000Z",
                                       "end_time" => "#{@future_date}T18:30:00.000Z"
                                    }
                                  ]
                              }
        end
      end
    end

    describe "#create" do 
      it "should require the :api_authentication_required before_filter to be triggered" do
        controller.should_receive(:api_authentication_required)
        post :create, format: :json, token: @access_key.token
      end

      context "valid params" do 
        it "should return newly created appointment info" do 
          appointment_params = {
            first_name: "Bill",
            last_name:  "Clinton", 
            start_time: "#{@future_date}T18:00:00.000Z",
            end_time:   "#{@future_date}T18:30:00.000Z"
          }

          expect {
            post :create, { format: :json, token: @access_key.token}.merge(appointment_params)
          }.to change(Appointment,:count).by(1)
          

          json["message"].should == "This appointment has successfully been created"
          json["appointment"]["first_name"].should == "Bill"
          json["appointment"]["last_name"].should  == "Clinton"
          json["appointment"]["start_time"].should == "#{@future_date}T18:00:00.000Z"
          json["appointment"]["end_time"].should   == "#{@future_date}T18:30:00.000Z"
        end

        it "should return 201 status code" do 
          appointment_params = {
            first_name: "Bill",
            last_name:  "Clinton", 
            start_time: "#{@future_date}T18:00:00.000Z",
            end_time:   "#{@future_date}T18:30:00.000Z"
          }
          post :create, { format: :json, token: @access_key.token}.merge(appointment_params)

          response.status.should == 201
        end
      end

      context "invalid_params" do
        it "should return appointment errors" do 
          appointment_params = {
            first_name: "Bill",
            start_time: "#{@future_date}T18:00:00.000Z",
            end_time:   "#{@future_date}T18:30:00.000Z"
          }

          expect {
            post :create, { format: :json, token: @access_key.token}.merge(appointment_params)
          }.to change(Appointment,:count).by(0)

          json["message"].should == "Unable to create this appointment"
          json["errors"].should  == {"last_name"=>["can't be blank"]}

        end

        it "should return 422 status code" do 
          appointment_params = {
            first_name: "Bill",
            start_time: "#{@future_date}T18:00:00.000Z",
            end_time:   "#{@future_date}T18:30:00.000Z"
          }
          post :create, { format: :json, token: @access_key.token}.merge(appointment_params)

          response.status.should == 422
        end
      end
    end

    describe "#update" do 
      before do 
        @appointment = create(:appointment, first_name: "Patrick", start_time: "#{@future_date}T15:00:00.000Z", end_time: "#{@future_date}T15:30:00.000Z")
      end

      it "should require the :api_authentication_required before_filter to be triggered" do
        controller.should_receive(:api_authentication_required)
        post :update, format: :json, token: @access_key.token, id: @appointment.id
      end

      context "valid params" do 
        it "should return updated appointment info" do 
          appointment_params = {
            start_time: "#{@future_date}T18:00:00.000Z",
            end_time:   "#{@future_date}T18:30:00.000Z"
          }

          @appointment.start_time.should == "#{@future_date}T15:00:00.000Z"
          @appointment.end_time.should   == "#{@future_date}T15:30:00.000Z"

          post :update, { format: :json, token: @access_key.token, id: @appointment.id }.merge(appointment_params)

          @appointment.reload.start_time.should == "#{@future_date}T18:00:00.000Z"
          @appointment.reload.end_time.should   == "#{@future_date}T18:30:00.000Z"

          json["message"].should                   == "This appointment has successfully been updated"
          json["appointment"]["id"].should         == @appointment.id
          json["appointment"]["start_time"].should == "#{@future_date}T18:00:00.000Z"
          json["appointment"]["end_time"].should   == "#{@future_date}T18:30:00.000Z"

        end

        it "should return 200 status code" do 
          appointment_params = {
            start_time: "#{@future_date}T18:00:00.000Z",
            end_time:   "#{@future_date}T18:30:00.000Z"
          }

          post :update, { format: :json, token: @access_key.token, id: @appointment.id }.merge(appointment_params)

          response.status.should == 200
        end
      end

      context "invalid_params" do
        it "should return appointment errors" do 
          appointment_params = {
            first_name: " ",
            start_time: "#{@future_date}T18:00:00.000Z",
            end_time:   "#{@future_date}T18:30:00.000Z"
          }

          post :update, { format: :json, token: @access_key.token, id: @appointment.id }.merge(appointment_params)

          json["message"].should == "Unable to update this appointment"
          json["errors"].should  == {"first_name"=>["can't be blank"]}

        end

        it "should return 422 status code" do 
          appointment_params = {
            first_name: " ",
            start_time: "#{@future_date}T18:00:00.000Z",
            end_time:   "#{@future_date}T18:30:00.000Z"
          }
          post :update, { format: :json, token: @access_key.token, id: @appointment.id }.merge(appointment_params)

          response.status.should == 422
        end
      end
    end

    describe "#destroy" do
      before do 
        @appointment = create(:appointment, first_name: "Patrick", start_time: "#{@future_date}T15:00:00.000Z", end_time: "#{@future_date}T15:30:00.000Z")
      end

      it "should require the :api_authentication_required before_filter to be triggered" do
        controller.should_receive(:api_authentication_required)
        delete :destroy, format: :json, token: @access_key.token, id: @appointment
      end

      it "should delete the appointment" do 
        expect {
          delete :destroy, format: :json, token: @access_key.token, id: @appointment
        }.to change(Appointment,:count).by(-1)
      end

      it "should return 200 status code" do 
        delete :destroy, format: :json, token: @access_key.token, id: @appointment

        response.status.should == 200
      end
    end
  end

  context "unauthenticatied requests" do
    it "should return the unauthenticatied error message" do 
      get :list, format: :json
      json.should ==  {"error" => {"message"=>"This request requires authentication."}}
    end

    it "should return 401 status code" do 
      get :list, format: :json
      response.status.should == 401
    end
  end
end