<?php
//include 'connection.php';
class Product{
  protected $id, $type, $name, $description, $price;
  public function __construct($id, $type, $name, $description, $price){
    $this->id = $id;
    $this->type = $type;
    $this->name = $name;
    $this->description = $description;
    $this->price = $price;
  }
  public function getType(){
    return $this->type;
  }
  public function getName(){
    return $this->name;
  }
  public function getDescription(){
    return $this->description;
  }
  public function getprice(){
    return $this->price;
  }
}


class DataBase{
  private $connection; //Conexão com banco de dados
  public function __construct($connection){
    $this->connection = $connection;
  }
  public function register(Product $product){
    $query = "INSERT INTO tableName (someTYpe, someName, someDescription, Price) VALUES (?,?,?,?)";
    $statement = $this->connection->prepare($query);
    $statement->bind_param("sssd", $product->getType(), $product->getName(), $product->getDescription(), $product->getPrice());
    $statement->execute();
    $statement->close();
  }
  public function listProduct(){
    $query = "SELECT * FROM tableName where someType = 'someValue' ORDER BY someNumberValue";
    $result = $this->connection->query($query);
    $productList = array();
    if($result->num_rows > 0){
      while($row = $result->fetch_assoc()){
        $product = new Product(
          $row['id'],
          $row['someType'],
          $row['name'],
          $row['description'],
          $row['price']
        );
        $productList[] = $product;
      }
    }
    return $productList;
  }

  public function updateProduct(){

    $query = "UPDATE tablename SET someField='someValue' WHERE id=someId";
    $statement = $this->connection->prepare($query);
    $statement->execute();
  
    echo $statement->rowCount() . " records UPDATED successfully";

  }

  public function deleteProduct(){

  try{

    $query = "DELETE FROM tablename WHERE id=someId";
    $this->connection->exec($query);
    echo "Record deleted successfully";
  
  }catch(PDOException $e) {
    echo $query . "<br>" . $e->getMessage();
  }

}
}

