require 'plane'
require 'airport'
require 'weather'

describe Plane do

  describe 'land' do

it {is_expected.to respond_to(:land).with(1).argument}

before do
      @airport = AirportStation.new
      @plane = subject
    end
end



describe "#full?" do
    before do
      @airport = AirportStation.new
      @plane = Plane.new
      allow(Weather).to receive(:stormy?) {false}
    end
    it { expect(@airport).to respond_to(:full?)}
    context "Airport is at maximum capacity, can not accept more planes." do
      it "cannot land" do
        100.times {Plane.new.land(@airport)}
        expect{@plane.land(@airport)}.to raise_error
      end
    end
  end

# describe "landing plane" do
#   before do
#     @plane = Plane.new
#   end
  # it "Accepts a plane to land at the airport" do
  #   expect(subject.land(@plane)).to eql([@plane])
  # end
#   it "Does not accept more planes if the airport capacity is at its maximum" do
#     AirportStation::DEFAULT_CAPACITY.times {subject.land(Plane.new)}
#     expect{subject.land(@plane)}.to raise_error(StandardError, "Airport is at maximum capacity, can not accept more planes.")
#   end
 # end

describe 'take_off' do
  it {expect(subject).to respond_to(:take_off).with(1).argument}

  before do
    @airport = AirportStation.new
    @plane = Plane.new
    @airport::planes << @plane
end
end


  describe "#safe?" do

      it {expect(subject).not_to respond_to(:safe?)}

      before do
        @plane = Plane.new
        @airport = AirportStation.new
        @airport::planes << @plane
      end

      context "if the weather is safe" do
         it "will #take_off and #landed" do
           allow(Weather).to receive(:stormy?).and_return( false )
           expect{@plane.take_off(@airport)}.to change{@airport.planes}
           expect{@plane.land(@airport)}.to change{@airport.planes}
         end
       end

       context "if the weather is not safe" do
         it "will not #take_off" do
           allow(Weather).to receive(:stormy?) {true}
           expect{@plane.take_off(@airport)}.to raise_error
           expect{@plane.land(@airport)}.to raise_error
         end
       end
     end


       describe "#full?" do
         before do
           @airport = AirportStation.new
           @plane = Plane.new
           allow(Weather).to receive(:stormy?) {false}
         end
         it { expect(@airport).to respond_to(:full?)}
         context "if the airport is full" do
           it "cannot land" do
             10.times {Plane.new.land(@airport)}
             expect{@plane.land(@airport)}.to raise_error
           end
         end
       end

end
