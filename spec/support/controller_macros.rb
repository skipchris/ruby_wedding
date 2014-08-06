module ControllerMacros
  def should_inherit_from_controller(parent_class)
    it "should inherit from #{parent_class}" do
      controller.class.superclass.should eq(parent_class)
    end
  end
end
