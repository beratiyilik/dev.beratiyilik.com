import type { NextPage } from 'next'
import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'
import useSWR from "swr";

const getRandomInt = (max: number): number => Math.floor(Math.random() * max)

type Data = {
  name: string;
};

const fetcher = async (url: string) => {
  const res = await fetch(url);
  if (!res.ok) {
    throw Error("Yo that's NOT OK!!!");
  }
  const data: Data = await res.json();
  return data;
};

const Home: NextPage = () => {
  const result = useSWR(`/api/hello`, fetcher);
  const data: Data | undefined = result.data;
  const error: Error = result.error;
  return (
    <div >
      {`Still Working:  ${data?.name}`}
    </div>
  )
}

export default Home
