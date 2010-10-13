require File.dirname(__FILE__) + '/../lib/amqp-spec/rspec'

context 'Following examples should all be failing:' do
  describe EventMachine, " when running failing examples" do
    include AMQP::EMSpec

    it "should not bubble failures beyond rspec" do
      EM.add_timer(0.1) do
        :should_not_bubble.should == :failures
        done
      end
    end

    it "should not block on failure" do
      1.should == 2
    end
  end

  describe EventMachine, " !!!!!!!!!!!!!!!!!!!!!!!!!! when testing with AMQP::EMSpec with a maximum execution time per test" do

    include AMQP::EMSpec

    default_timeout 1

    it 'should timeout before reaching done' do
      EM.add_timer(2) {
        done
      }
    end

    it 'should timeout before reaching done' do
      timeout(0.2)
      EM.add_timer(0.5) {
        done
      }
    end
  end

  describe AMQP, " when testing with AMQP::Spec with a maximum execution time per test" do

    include AMQP::Spec

    default_timeout 1

    it 'should timeout before reaching done' do
      EM.add_timer(2) {
        done
      }
    end

    it 'should timeout before reaching done' do
      timeout(0.2)
      EM.add_timer(0.5) {
        done
      }
    end
  end

  describe AMQP, " when testing with AMQP::SpecHelper with spec timeouts" do
    include AMQP::Spec

    default_timeout 0.5

    it 'should fail due to default timeout, not hang up' do
    end
  end
end