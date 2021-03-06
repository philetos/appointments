require 'spec_helper'

describe Appointment do
  context 'validations' do
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

    it "should require that :start_time is before :end_time" do 
      future_date = (DateTime.now + 3.days).strftime("%Y-%m-%d")

      appointment_1 = build(:appointment, start_time: "#{future_date} 5:00 PM", end_time: "#{future_date} 5:30 PM")
      appointment_1.should be_valid

      appointment_2 = build(:appointment, start_time: "#{future_date} 5:30 PM", end_time: "#{future_date} 5:00 PM")
      appointment_2.should_not be_valid
    end

    it "should require that :start_time and :end_time do not overlap an existing appointment" do 
      future_date = (DateTime.now + 3.days).strftime("%Y-%m-%d")
      create(:appointment, start_time: "#{future_date} 5:00 PM", end_time: "#{future_date} 5:30 PM")

      appointment_1 = build(:appointment, start_time: "#{future_date} 4:00 PM", end_time: "#{future_date} 4:30 PM")
      appointment_1.should be_valid

      appointment_2 = build(:appointment, start_time: "#{future_date} 5:31 PM", end_time: "#{future_date} 6:30 PM")
      appointment_2.should be_valid

      appointment_3 = build(:appointment, start_time: "#{future_date} 5:15 PM", end_time: "#{future_date} 6:00 PM")
      appointment_3.should_not be_valid

      appointment_4 = build(:appointment, start_time: "#{future_date} 12:31 PM", end_time: "#{future_date} 10:30 PM")
      appointment_4.should_not be_valid
    end

    it "should require that the :start_time be set in the future" do
      past_date   = (DateTime.now - 3.days).strftime("%Y-%m-%d")
      future_date = (DateTime.now + 3.days).strftime("%Y-%m-%d")

      appointment_1 = build(:appointment, start_time: "#{past_date} 5:00 PM", end_time: "#{past_date} 5:30 PM")
      appointment_1.should_not be_valid

      appointment_2 = build(:appointment, start_time: "#{past_date} 5:30 PM", end_time: "#{future_date} 5:00 PM")
      appointment_2.should_not be_valid
    end

  end

  context 'class/scope methods' do 
    describe "::overlap" do 
      it "should return overlapping appointments" do
        future_date = (DateTime.now + 3.days).strftime("%Y-%m-%d")
        existing_appt_1 = create(:appointment, start_time: "#{future_date} 5:00 PM", end_time: "#{future_date} 5:30 PM")
        existing_appt_2 = create(:appointment, start_time: "#{future_date} 7:00 PM", end_time: "#{future_date} 8:30 PM")

        appointment = build(:appointment, start_time: "#{future_date} 5:15 PM", end_time: "#{future_date} 6:00 PM")

        Appointment.overlaps(appointment).should     include(existing_appt_1)
        Appointment.overlaps(appointment).should_not include(existing_appt_2)
      end
    end
  end

  context 'instance methods' do 
    describe "#overlaps_existing_appointment?" do 
      it "should check for appointment overlaps" do
        future_date = (DateTime.now + 3.days).strftime("%Y-%m-%d")
        existing_appt = create(:appointment, start_time: "#{future_date} 5:00 PM", end_time: "#{future_date} 5:30 PM")
  
        appointment_1 = build(:appointment, start_time: "#{future_date} 5:15 PM", end_time: "#{future_date} 6:00 PM")
        appointment_2 = build(:appointment, start_time: "#{future_date} 7:00 PM", end_time: "#{future_date} 8:30 PM")

        appointment_1.overlaps_existing_appointment?.should == true
        appointment_2.overlaps_existing_appointment?.should == false
      end
    end
  end
end