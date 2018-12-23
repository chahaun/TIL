const taxi = {
    make:"웹타운 모터스",
    model:"택시",
    year: 1955,
    color: "노란색",
    passengers: 4,
    convertible: false,
    mileage: 281341
};

function prequal(car) {
    if(car.mileage > 10000){
        return false;
    } else if (car.year > 1960) {
        return false;
    }
    return true;
}

const worthALook = prequal(taxi);

if (worthALook) {
    document.write(taxi.make + " " + taxi.model + "모델을 확인해보세요.");
} else {
    document.write(`${taxi.make} ${taxi.model} 모델은 확인할 필요 없습니다.`);
}