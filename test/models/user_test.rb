require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(nome: "Example User", email: "user@example.com", cpf:"aaaaaaaaaaa", telefone:"5521999999999", matricula:"111111111" )
  end

  test "should be valid" do
    assert @user.valid?
  end

# Teste Nomes
  test "nome should be present" do
    @user.nome = ""
    assert_not @user.valid?
  end

  test "nome should not be too long" do
    @user.nome = "a" * 51
    assert_not @user.valid?
  end

# Teste Emails
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  
# Testes CPF
  test "CPF should be present" do
    @user.cpf = ""
    assert_not @user.valid?
  end

  test "CPF should be 11 chars long L" do
    @user.cpf = "1" * 12
    assert_not @user.valid?
  end
  
  test "CPF should be 11 chars long S" do
    @user.cpf = "1" * 10
    assert_not @user.valid?
  end
  
  test "CPF should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
  
# Testes Telefone
  test "telefone should be present" do
    @user.telefone = ""
    assert_not @user.valid?
  end

  test "telefone should not be too short" do
    @user.telefone = "1" * 7
    assert_not @user.valid?
  end
  
  test "telefone should not be too long" do
    @user.telefone = "1" * 31
    assert_not @user.valid?
  end

# Testes Matricula

test "Matricula should be present" do
    @user.matricula = ""
    assert_not @user.valid?
  end

  test "Matricula should be 9 chars long L" do
    @user.matricula = "1" * 10
    assert_not @user.valid?
  end
  
  test "Matricula should be 9 chars long S" do
    @user.matricula = "1" * 8
    assert_not @user.valid?
  end
  
  test "Matricula should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
end
