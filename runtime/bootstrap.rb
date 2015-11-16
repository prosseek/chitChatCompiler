# Bootstrap the runtime. This is where we assemble all the classes and objects together
# to form the runtime.

Klass = RClass.new("Class")                     # Class
Klass.runtime_class = Klass     # Class.class = Class
Obzect = RClass.new("Object")                    # Object = Class.new
Obzect.runtime_class = Klass    # Object.class = Class

Runtime = Context.new(Obzect.new) # Object.new

Runtime["Class"] = Klass
Runtime["Object"] = Obzect
Runtime["Number"] = RClass.new("Number", "Object")
Runtime["String"] = RClass.new("String", "Object")
Runtime["True"] = RClass.new("True", "Object")
Runtime["False"] = RClass.new("False", "Object")
Runtime["Nil"] = RClass.new("Nil", "Object")

Runtime["true"] = Runtime["True"].new_with_value(true)
Runtime["false"] = Runtime["False"].new_with_value(false)
Runtime["nil"] = Runtime["Nil"].new_with_value(nil)

## Added

# toplevel stores the runtime at the top level
Runtime["__toplevel__"] = Runtime
# classVariables stores the classVariables for each class
# the variables should start with @@
# i.e., Hello@@world means the Hello class has @@world class variable
Runtime["__classVariables__"] = {}