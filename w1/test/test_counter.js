
const { expect } = require("chai");
const { ethers } = require("hardhat");
const { getLogs } = require("./utils");

describe("Counter", function () {
  it("Should ...", async function () {
    const c = 10;
    const Counter = await ethers.getContractFactory("Counter");
    const counter = await Counter.deploy(c);
    await counter.deployed();
    expect(await counter.counter()).to.eq(c);
    const tx = await counter.count()
    expect(await getLogs(tx, "counterChanged", "_to")).to.eq(c + 1);
  });
});
