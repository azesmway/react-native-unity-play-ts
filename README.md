# react-native-unity-play-ts

react-native-unity-play-ts

## Installation

```sh
npm install react-native-unity-play-ts
```

## Usage

```js
import React, { useRef, useEffect } from 'react';
import UnityPlayView from 'react-native-unity-play-ts';

interface IMessage {
  gameObject: string;
  methodName: string;
  message: string;
}

const Unity = () => {
  const unityRef = useRef();
  const message: IMessage = {
    gameObject: 'gameObject',
    methodName: 'methodName',
    message: 'message',
  };

  useEffect(() => {
    setTimeout(() => {
      if (unityRef && unityRef.current) {
        unityRef.current.postMessage(message);
      }
    }, 6000);
  }, []);

  return <UnityPlayView ref={unityRef} style={{ flex: 1 }} />;
};

export default Unity;

```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
